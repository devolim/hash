import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

/**
 * Register a send token for a mailbox.
 *
 * When a user accepts a contact request, they generate a send_token
 * and register it here. The sender must provide this token to send
 * messages to this mailbox.
 *
 * Input: JWT + { mailbox_token, send_token_hash }
 * - mailbox_token: The mailbox that will accept messages with this token
 * - send_token_hash: HMAC of the send token (not stored in clear)
 */
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
    const { mailbox_token, send_token_hash } = body

    if (!mailbox_token || typeof mailbox_token !== 'string') {
      return new Response(
        JSON.stringify({ error: 'mailbox_token requis' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!send_token_hash || typeof send_token_hash !== 'string') {
      return new Response(
        JSON.stringify({ error: 'send_token_hash requis' }),
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

    // Validate session
    const sessionCheck = await validateSessionStrict(supabaseAdmin, authHeader, supabaseUser)
    if (!sessionCheck.valid) {
      return new Response(
        JSON.stringify({ error: sessionCheck.error || 'Session invalide' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const userId = sessionCheck.userId!

    // Verify the mailbox belongs to this user
    const { data: mailbox } = await supabaseAdmin
      .from('mailboxes')
      .select('id, user_id')
      .eq('mailbox_token', mailbox_token)
      .eq('is_active', true)
      .single()

    if (!mailbox || mailbox.user_id !== userId) {
      return new Response(
        JSON.stringify({ error: 'Mailbox non autorisée' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Insert the send token (upsert to handle duplicates)
    const { error: insertError } = await supabaseAdmin
      .from('mailbox_send_tokens')
      .upsert({
        mailbox_token,
        send_token_hash,
        is_active: true,
        created_at: new Date().toISOString(),
      }, {
        onConflict: 'mailbox_token,send_token_hash'
      })

    if (insertError) {
      console.error('[REGISTER-SEND-TOKEN] erreur insertion:', insertError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de l\'enregistrement' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log('[REGISTER-SEND-TOKEN] token enregistré')

    return new Response(
      JSON.stringify({ success: true }),
      { status: 201, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[REGISTER-SEND-TOKEN] erreur:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
