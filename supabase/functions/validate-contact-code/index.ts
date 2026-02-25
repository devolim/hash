import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Rate limiting for validation
const RATE_LIMIT_CONFIG = {
  maxAttempts: 30,
  windowMinutes: 60,
  blockMinutes: 60
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
    const { target_hash_id, temporary_code } = body

    // Validation
    if (!target_hash_id || typeof target_hash_id !== 'string') {
      return new Response(
        JSON.stringify({ error: 'target_hash_id invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!temporary_code || typeof temporary_code !== 'string') {
      return new Response(
        JSON.stringify({ error: 'temporary_code invalide' }),
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

    // Get requester data to check self-add
    const { data: requesterData, error: requesterError } = await supabaseAdmin
      .from('users')
      .select('hash_id')
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
    const ipCheck = await checkRateLimit(
      supabaseAdmin, `ip:${clientIP}`, 'validate_code', RATE_LIMIT_CONFIG
    )
    if (!ipCheck.allowed) {
      console.log('[VALIDATE-CONTACT-CODE] rate limit IP')
      return new Response(
        JSON.stringify({ error: ipCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Find target user
    const { data: targetUser, error: targetError } = await supabaseAdmin
      .from('users')
      .select('id, hash_id, identity_public_key, sealed_sender_public_key')
      .eq('hash_id', target_hash_id.toUpperCase())
      .single()

    if (targetError || !targetUser) {
      return new Response(
        JSON.stringify({ error: 'Utilisateur non trouvé' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Verify temporary code
    const { data: codeData, error: codeError } = await supabaseAdmin
      .from('temporary_codes')
      .select('id')
      .eq('user_id', targetUser.id)
      .eq('code', temporary_code)
      .gt('expires_at', new Date().toISOString())
      .single()

    if (codeError || !codeData) {
      return new Response(
        JSON.stringify({ error: 'Code temporaire invalide ou expiré' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Check if there's already a pending request
    const { data: existingRequest } = await supabaseAdmin
      .from('contact_requests')
      .select('id, requester_id')
      .or(`and(requester_id.eq.${userId},recipient_id.eq.${targetUser.id}),and(requester_id.eq.${targetUser.id},recipient_id.eq.${userId})`)
      .eq('status', 'pending')
      .single()

    if (existingRequest) {
      const errorMessage = existingRequest.requester_id === userId
        ? 'Une demande est déjà en attente'
        : 'Cette personne vous a déjà envoyé une demande'
      return new Response(
        JSON.stringify({ error: errorMessage }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Temporary code stays active until its natural expiration (5 min)
    // so multiple people can use the same code to send contact requests

    // Generate exchange token (15 min TTL) to allow the requester to take
    // their time filling in the request details without the code expiring
    const exchangeToken = crypto.randomUUID()
    const exchangeExpiresAt = new Date(Date.now() + 15 * 60 * 1000).toISOString()

    const { error: exchangeError } = await supabaseAdmin
      .from('temporary_codes')
      .insert({
        user_id: targetUser.id,
        code: exchangeToken,
        expires_at: exchangeExpiresAt,
      })

    if (exchangeError) {
      console.error('[VALIDATE-CONTACT-CODE] exchange token insert error:', JSON.stringify(exchangeError))
      return new Response(
        JSON.stringify({ error: 'Erreur serveur interne' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log('[VALIDATE-CONTACT-CODE] code valide, exchange token généré')

    // Return success with exchange token and recipient's public key
    return new Response(
      JSON.stringify({
        success: true,
        valid: true,
        exchange_token: exchangeToken,
        recipient: {
          hash_id: targetUser.hash_id,
          identity_public_key: targetUser.identity_public_key,
          sealed_sender_public_key: targetUser.sealed_sender_public_key
        },
        timestamp: new Date().toISOString()
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[VALIDATE-CONTACT-CODE] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
