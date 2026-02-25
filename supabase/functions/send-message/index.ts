import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Configuration du rate limiting pour l'envoi de messages
const RATE_LIMIT_CONFIG = {
  maxAttempts: 60,     // 60 messages max
  windowMinutes: 1,    // Par minute (1 msg/sec en moyenne)
  blockMinutes: 15     // Bloqué 15 min si spam
}

// Rate limit plus strict pour les nouveaux contacts (anti-harcèlement)
const RATE_LIMIT_NEW_CONTACT = {
  maxAttempts: 10,     // 10 messages max vers un nouveau contact
  windowMinutes: 60,   // Par heure
  blockMinutes: 60     // Bloqué 1h si dépassé
}

const MAX_MESSAGE_SIZE = 65536 // 64KB

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
    const { recipient_id, encrypted_content, encrypted_media_url, media_downloadable } = body

    // Validation
    if (!recipient_id || typeof recipient_id !== 'string') {
      return new Response(
        JSON.stringify({ error: 'recipient_id invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!encrypted_content || typeof encrypted_content !== 'string') {
      return new Response(
        JSON.stringify({ error: 'encrypted_content invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (encrypted_content.length > MAX_MESSAGE_SIZE) {
      return new Response(
        JSON.stringify({ error: 'Message trop volumineux' }),
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

    // Validation stricte de la session (vérifie aussi session_valid_after)
    const sessionCheck = await validateSessionStrict(supabaseAdmin, authHeader, supabaseUser)
    if (!sessionCheck.valid) {
      return new Response(
        JSON.stringify({ error: sessionCheck.error || 'Session invalide' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const senderId = sessionCheck.userId!
    const clientIP = getClientIP(req)

    if (senderId === recipient_id) {
      return new Response(
        JSON.stringify({ error: 'Impossible d\'envoyer un message à soi-même' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Vérifier destinataire
    const { data: recipientData, error: recipientError } = await supabaseAdmin
      .from('users')
      .select('id, hash_id')
      .eq('id', recipient_id)
      .single()

    if (recipientError || !recipientData) {
      return new Response(
        JSON.stringify({ error: 'Destinataire non trouvé' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Vérifier expéditeur
    const { data: senderData, error: senderError } = await supabaseAdmin
      .from('users')
      .select('id, hash_id')
      .eq('id', senderId)
      .single()

    if (senderError || !senderData) {
      return new Response(
        JSON.stringify({ error: 'Expéditeur non trouvé' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Rate limiting global
    const globalCheck = await checkRateLimit(
      supabaseAdmin, `user:${senderId}`, 'send_message', RATE_LIMIT_CONFIG
    )
    if (!globalCheck.allowed) {
      console.log('[SEND-MESSAGE] rate limit utilisateur')
      return new Response(
        JSON.stringify({ error: globalCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Rate limiting par paire (anti-harcèlement)
    const pairCheck = await checkRateLimit(
      supabaseAdmin, `pair:${senderId}:${recipient_id}`, 'send_message_pair', RATE_LIMIT_NEW_CONTACT
    )
    if (!pairCheck.allowed) {
      console.log('[SEND-MESSAGE] rate limit paire')
      return new Response(
        JSON.stringify({ error: 'Trop de messages envoyés à ce contact' }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Rate limiting IP
    const ipCheck = await checkRateLimit(
      supabaseAdmin, `ip:${clientIP}`, 'send_message', { maxAttempts: 120, windowMinutes: 1, blockMinutes: 30 }
    )
    if (!ipCheck.allowed) {
      console.log('[SEND-MESSAGE] rate limit IP')
      return new Response(
        JSON.stringify({ error: ipCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Insérer le message
    const { data: messageData, error: insertError } = await supabaseAdmin
      .from('pending_messages')
      .insert({
        sender_id: senderId,
        recipient_id: recipient_id,
        encrypted_content: encrypted_content,
        encrypted_media_url: encrypted_media_url || null,
        media_downloadable: media_downloadable || false,
        status: 'pending'
      })
      .select('id')
      .single()

    if (insertError) {
      console.error('[SEND-MESSAGE] erreur insertion:', insertError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de l\'envoi du message' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log('[SEND-MESSAGE] message envoyé')

    return new Response(
      JSON.stringify({
        success: true,
        message_id: messageData.id,
        timestamp: new Date().toISOString()
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[SEND-MESSAGE] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
