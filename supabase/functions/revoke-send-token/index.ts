import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

/**
 * Revoke send token(s) for a mailbox.
 *
 * Used when a contact is deleted — their send_token is revoked
 * so they can no longer send messages.
 *
 * Input: JWT + { send_token_hash } OR { mailbox_token } (revoke all)
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
    const { send_token_hash, mailbox_token } = body

    if (!send_token_hash && !mailbox_token) {
      return new Response(
        JSON.stringify({ error: 'send_token_hash ou mailbox_token requis' }),
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

    if (mailbox_token) {
      // Revoke ALL tokens for this mailbox (verify ownership)
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

      await supabaseAdmin
        .from('mailbox_send_tokens')
        .update({ is_active: false })
        .eq('mailbox_token', mailbox_token)
        .eq('is_active', true)

      console.log('[REVOKE-SEND-TOKEN] tous les tokens révoqués pour une mailbox')
    } else {
      // Revoke a specific token — need to verify the mailbox belongs to user
      const { data: tokenData } = await supabaseAdmin
        .from('mailbox_send_tokens')
        .select('mailbox_token')
        .eq('send_token_hash', send_token_hash)
        .eq('is_active', true)
        .single()

      if (tokenData) {
        // Verify the mailbox belongs to this user
        const { data: mailbox } = await supabaseAdmin
          .from('mailboxes')
          .select('user_id')
          .eq('mailbox_token', tokenData.mailbox_token)
          .single()

        if (!mailbox || mailbox.user_id !== userId) {
          return new Response(
            JSON.stringify({ error: 'Non autorisé' }),
            { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          )
        }

        await supabaseAdmin
          .from('mailbox_send_tokens')
          .update({ is_active: false })
          .eq('send_token_hash', send_token_hash)
      }

      console.log('[REVOKE-SEND-TOKEN] token révoqué')
    }

    return new Response(
      JSON.stringify({ success: true }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[REVOKE-SEND-TOKEN] erreur:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
