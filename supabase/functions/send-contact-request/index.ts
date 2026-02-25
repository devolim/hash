import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Rate limiting for contact requests
const RATE_LIMIT_CONFIG = {
  maxAttempts: 20,     // 20 requests max
  windowMinutes: 60,   // Per hour
  blockMinutes: 120    // Blocked 2h if exceeded
}

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const authHeader = req.headers.get('Authorization')
    if (!authHeader) {
      return new Response(
        JSON.stringify({ error: 'Authorization manquante' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const body = await req.json()
    const { target_hash_id, exchange_token, encrypted_message } = body

    // Validation
    if (!target_hash_id || typeof target_hash_id !== 'string') {
      return new Response(
        JSON.stringify({ error: 'target_hash_id invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!exchange_token || typeof exchange_token !== 'string') {
      return new Response(
        JSON.stringify({ error: 'exchange_token invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Validate encrypted_message length (base64 of 500 chars ≈ ~700 chars, cap at 1000)
    if (encrypted_message && (typeof encrypted_message !== 'string' || encrypted_message.length > 1000)) {
      return new Response(
        JSON.stringify({ error: 'Message trop long' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Validate Hash ID format (XXX-XXX-XXX)
    const hashIdRegex = /^[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{3}$/
    if (!hashIdRegex.test(target_hash_id.toUpperCase())) {
      return new Response(
        JSON.stringify({ error: 'Format hash_id invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      { auth: { autoRefreshToken: false, persistSession: false } }
    )

    const supabaseUser = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      {
        global: { headers: { Authorization: authHeader } },
        auth: { autoRefreshToken: false, persistSession: false }
      }
    )

    // Strict session validation
    const sessionCheck = await validateSessionStrict(supabaseAdmin, authHeader, supabaseUser)
    if (!sessionCheck.valid) {
      return new Response(
        JSON.stringify({ error: sessionCheck.error || 'Session invalide' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const userId = sessionCheck.userId!
    const clientIP = getClientIP(req)

    // Get requester data (including Zero-Knowledge tokens)
    const { data: requesterData, error: requesterError } = await supabaseAdmin
      .from('users')
      .select('id, hash_id, identity_public_key, signed_prekey_public, signed_prekey_signature, signed_prekey_id, mailbox_token, relay_token, sealed_sender_public_key')
      .eq('id', userId)
      .single()

    if (requesterError || !requesterData) {
      return new Response(
        JSON.stringify({ error: 'Utilisateur non trouvé' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Prevent adding self
    if (requesterData.hash_id.toUpperCase() === target_hash_id.toUpperCase()) {
      return new Response(
        JSON.stringify({ error: 'Vous ne pouvez pas vous ajouter vous-même' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Rate limiting
    const userCheck = await checkRateLimit(
      supabaseAdmin, `user:${userId}`, 'contact_request', RATE_LIMIT_CONFIG
    )
    if (!userCheck.allowed) {
      console.log('[SEND-CONTACT-REQUEST] rate limit utilisateur')
      return new Response(
        JSON.stringify({ error: userCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const ipCheck = await checkRateLimit(
      supabaseAdmin, `ip:${clientIP}`, 'contact_request',
      { maxAttempts: 50, windowMinutes: 60, blockMinutes: 60 }
    )
    if (!ipCheck.allowed) {
      console.log('[SEND-CONTACT-REQUEST] rate limit IP')
      return new Response(
        JSON.stringify({ error: ipCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Find target user
    const { data: targetUser, error: targetError } = await supabaseAdmin
      .from('users')
      .select('id, hash_id')
      .eq('hash_id', target_hash_id.toUpperCase())
      .single()

    if (targetError || !targetUser) {
      return new Response(
        JSON.stringify({ error: 'Utilisateur non trouvé' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Verify exchange token (generated by validate-contact-code, 15 min TTL)
    const { data: tokenData, error: tokenError } = await supabaseAdmin
      .from('temporary_codes')
      .select('id')
      .eq('user_id', targetUser.id)
      .eq('code', exchange_token)
      .gt('expires_at', new Date().toISOString())
      .single()

    if (tokenError || !tokenData) {
      return new Response(
        JSON.stringify({ error: 'Jeton d\'échange invalide ou expiré' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Consume the exchange token
    await supabaseAdmin
      .from('temporary_codes')
      .delete()
      .eq('id', tokenData.id)

    // Check if there's already a pending request in either direction
    const { data: existingRequest } = await supabaseAdmin
      .from('contact_requests')
      .select('id, status, requester_id')
      .or(`and(requester_id.eq.${userId},recipient_id.eq.${targetUser.id}),and(requester_id.eq.${targetUser.id},recipient_id.eq.${userId})`)
      .eq('status', 'pending')
      .single()

    if (existingRequest) {
      if (existingRequest.requester_id === userId) {
        return new Response(
          JSON.stringify({ error: 'Une demande est déjà en attente' }),
          { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
      } else {
        // The target already sent us a request - notify the user
        return new Response(
          JSON.stringify({ error: 'Cette personne vous a déjà envoyé une demande' }),
          { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
      }
    }

    // Get and consume one prekey from the requester
    const { data: prekey, error: prekeyError } = await supabaseAdmin
      .from('prekeys')
      .select('*')
      .eq('user_id', userId)
      .limit(1)
      .single()

    if (prekeyError || !prekey) {
      return new Response(
        JSON.stringify({ error: 'Aucune prekey disponible' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Delete the used prekey
    await supabaseAdmin
      .from('prekeys')
      .delete()
      .eq('id', prekey.id)

    // Create the contact request (expires in 24h)
    const expiresAt = new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString()

    const { data: contactRequest, error: insertError } = await supabaseAdmin
      .from('contact_requests')
      .insert({
        requester_id: userId,
        requester_hash_id: requesterData.hash_id,
        recipient_id: targetUser.id,
        recipient_hash_id: targetUser.hash_id,
        status: 'pending',
        expires_at: expiresAt,
        encrypted_message: encrypted_message || null,
        // Signal Protocol keys
        requester_identity_public_key: requesterData.identity_public_key,
        requester_signed_prekey_public: requesterData.signed_prekey_public,
        requester_signed_prekey_signature: requesterData.signed_prekey_signature,
        requester_signed_prekey_id: requesterData.signed_prekey_id,
        requester_prekey_id: prekey.prekey_id,
        requester_prekey_public: prekey.public_key,
        // Zero-Knowledge tokens (for sealed sender messaging)
        requester_mailbox_token: requesterData.mailbox_token,
        requester_relay_token: requesterData.relay_token,
        requester_sealed_sender_public_key: requesterData.sealed_sender_public_key
      })
      .select()
      .single()

    if (insertError) {
      console.error('[SEND-CONTACT-REQUEST] Insert error:', insertError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de la création de la demande' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log('[SEND-CONTACT-REQUEST] demande envoyée')

    return new Response(
      JSON.stringify({
        success: true,
        request_id: contactRequest.id,
        expires_at: contactRequest.expires_at,
        timestamp: new Date().toISOString()
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[SEND-CONTACT-REQUEST] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
