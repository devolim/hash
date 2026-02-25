import { serve } from "https://deno.land/std@0.177.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { validateSessionStrict } from "../_shared/session-validator.ts"
import { checkRateLimit, getClientIP, type RateLimitConfig } from "../_shared/rate-limiter.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

const RATE_LIMIT_CONFIG: RateLimitConfig = {
  maxAttempts: 30,
  windowMinutes: 60,
  blockMinutes: 15,
}

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    // Parse body
    let body: Record<string, unknown>
    try {
      body = await req.json()
    } catch {
      return new Response(
        JSON.stringify({ error: 'Invalid JSON body', error_code: 'INVALID_JSON' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const { message_id, media_file_id, send_token, recipient_mailbox_token } = body

    // Validate required fields
    if (!message_id || typeof message_id !== 'string') {
      return new Response(
        JSON.stringify({ error: 'message_id requis', error_code: 'INVALID_MESSAGE_ID' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!send_token || typeof send_token !== 'string') {
      return new Response(
        JSON.stringify({ error: 'send_token requis', error_code: 'INVALID_SEND_TOKEN' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!recipient_mailbox_token || typeof recipient_mailbox_token !== 'string' || recipient_mailbox_token.length !== 64) {
      return new Response(
        JSON.stringify({ error: 'recipient_mailbox_token invalide', error_code: 'INVALID_MAILBOX_TOKEN' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Create Supabase clients
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      { auth: { autoRefreshToken: false, persistSession: false } }
    )

    const authHeader = req.headers.get('Authorization') ?? ''
    const supabaseUser = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      {
        global: { headers: { Authorization: authHeader } },
        auth: { autoRefreshToken: false, persistSession: false }
      }
    )

    // Auth: validate session
    const session = await validateSessionStrict(supabaseAdmin, authHeader, supabaseUser)
    if (!session.valid) {
      return new Response(
        JSON.stringify({ error: session.error, error_code: 'AUTH_ERROR' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Rate limiting
    const userId = session.userId!
    const rateLimitCheck = await checkRateLimit(
      supabaseAdmin, `user:${userId}`, 'revoke_message', RATE_LIMIT_CONFIG
    )
    if (!rateLimitCheck.allowed) {
      return new Response(
        JSON.stringify({ error: rateLimitCheck.message, error_code: 'RATE_LIMITED' }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Verify send_token: hash it and check against mailbox_send_tokens
    const tokenHash = await crypto.subtle.digest(
      'SHA-256',
      new TextEncoder().encode(send_token as string)
    ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

    const { data: validToken } = await supabaseAdmin
      .from('mailbox_send_tokens')
      .select('id')
      .eq('mailbox_token', recipient_mailbox_token)
      .eq('send_token_hash', tokenHash)
      .eq('is_active', true)
      .single()

    if (!validToken) {
      return new Response(
        JSON.stringify({ error: 'send_token invalide', error_code: 'INVALID_SEND_TOKEN' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Check message exists and is not yet delivered
    const { data: message, error: msgError } = await supabaseAdmin
      .from('sealed_messages')
      .select('id, recipient_mailbox_token, is_delivered')
      .eq('id', message_id)
      .single()

    if (msgError || !message) {
      return new Response(
        JSON.stringify({ error: 'Message non trouvé', error_code: 'MESSAGE_NOT_FOUND' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Verify the message belongs to the same mailbox
    if (message.recipient_mailbox_token !== recipient_mailbox_token) {
      return new Response(
        JSON.stringify({ error: 'send_token invalide', error_code: 'INVALID_SEND_TOKEN' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Check if already delivered
    if (message.is_delivered) {
      return new Response(
        JSON.stringify({ error: 'Message déjà délivré', error_code: 'ALREADY_DELIVERED' }),
        { status: 409, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Delete the message from sealed_messages
    const { error: deleteError } = await supabaseAdmin
      .from('sealed_messages')
      .delete()
      .eq('id', message_id)

    if (deleteError) {
      console.error('[REVOKE-MESSAGE] Delete message error:', deleteError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de la suppression', error_code: 'DELETE_ERROR' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Handle media revocation if media_file_id provided
    let mediaRevoked = false
    if (media_file_id && typeof media_file_id === 'string') {
      try {
        // Check media file exists and is not downloaded
        const { data: mediaFile } = await supabaseAdmin
          .from('media_files')
          .select('id, file_path, file_size, is_downloaded, uploader_id')
          .eq('id', media_file_id)
          .single()

        if (mediaFile && !mediaFile.is_downloaded) {
          // Delete from Storage bucket
          const { error: storageError } = await supabaseAdmin
            .storage
            .from('media')
            .remove([mediaFile.file_path])

          if (storageError) {
            console.error('[REVOKE-MESSAGE] Storage delete error:', storageError)
          }

          // Delete media_files entry
          const { error: mediaDeleteError } = await supabaseAdmin
            .from('media_files')
            .delete()
            .eq('id', media_file_id)

          if (mediaDeleteError) {
            console.error('[REVOKE-MESSAGE] Media file delete error:', mediaDeleteError)
          }

          // Update user quota
          if (mediaFile.uploader_id && mediaFile.file_size) {
            await supabaseAdmin.rpc('update_media_quota', {
              p_user_id: mediaFile.uploader_id,
              p_size_delta: -mediaFile.file_size,
            }).catch((e: unknown) => console.error('[REVOKE-MESSAGE] Quota update error:', e))
          }

          mediaRevoked = true
        }
      } catch (e) {
        console.error('[REVOKE-MESSAGE] Media revocation error:', e)
      }
    }

    console.log(`[REVOKE-MESSAGE] Message ${message_id} revoked, media: ${mediaRevoked}`)

    return new Response(
      JSON.stringify({
        success: true,
        message_revoked: true,
        media_revoked: mediaRevoked,
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[REVOKE-MESSAGE] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur interne', error_code: 'INTERNAL_ERROR' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
