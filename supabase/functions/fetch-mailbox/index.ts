import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

/**
 * Fetch messages from an anonymous mailbox.
 *
 * The client proves ownership by:
 * 1. Being authenticated (session check)
 * 2. Providing their mailbox_token (derived from their identity key)
 *
 * The server validates the token belongs to this user, then returns sealed messages.
 * The server cannot read message contents or know who sent them.
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

    let body: Record<string, unknown>
    try {
      body = await req.json()
    } catch {
      return new Response(
        JSON.stringify({ error: 'Invalid JSON body' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }
    const {
      mailbox_token,      // The user's anonymous mailbox token
      since,              // Optional: Only fetch messages after this timestamp
      limit = 100,        // Max messages to fetch
      mark_delivered = true // Whether to mark messages as delivered after fetch
    } = body

    // Validation
    if (!mailbox_token || typeof mailbox_token !== 'string' || mailbox_token.length !== 64) {
      return new Response(
        JSON.stringify({ error: 'mailbox_token invalide' }),
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
    const { data: mailbox, error: mailboxError } = await supabaseAdmin
      .from('mailboxes')
      .select('id, user_id')
      .eq('mailbox_token', mailbox_token)
      .eq('is_active', true)
      .single()

    if (mailboxError || !mailbox) {
      return new Response(
        JSON.stringify({ error: 'Mailbox non trouvée' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (mailbox.user_id !== userId) {
      // Someone is trying to access another user's mailbox
      console.error('[FETCH-MAILBOX] accès non autorisé')
      return new Response(
        JSON.stringify({ error: 'Accès non autorisé' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Build query for messages
    let query = supabaseAdmin
      .from('sealed_messages')
      .select('id, sealed_envelope, created_at')
      .eq('recipient_mailbox_token', mailbox_token)
      .eq('is_delivered', false)
      .order('created_at', { ascending: true })
      .limit(Math.min(limit, 500))

    if (since) {
      query = query.gt('created_at', since)
    }

    const { data: messages, error: messagesError } = await query

    if (messagesError) {
      console.error('[FETCH-MAILBOX] Error fetching messages:', messagesError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de la récupération des messages' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Format messages for response
    const formattedMessages = messages?.map(m => ({
      id: m.id,
      sealed_envelope: m.sealed_envelope, // Already base64 from DB
      timestamp: m.created_at
    })) || []

    // Delete messages BEFORE returning the response (zero-trace)
    // If delete fails, return 500 to force client retry rather than losing messages
    if (mark_delivered && messages && messages.length > 0) {
      const messageIds = messages.map(m => m.id)

      const { error: deleteError } = await supabaseAdmin
        .from('sealed_messages')
        .delete()
        .in('id', messageIds)

      if (deleteError) {
        console.error('[FETCH-MAILBOX] Error deleting messages:', deleteError)
        return new Response(
          JSON.stringify({ error: 'Erreur lors de la suppression des messages' }),
          { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
      }

      console.log('[FETCH-MAILBOX] messages supprimés avant réponse')
    }

    console.log(`[FETCH-MAILBOX] Returned ${formattedMessages.length} messages for mailbox`)

    return new Response(
      JSON.stringify({
        success: true,
        messages: formattedMessages,
        count: formattedMessages.length
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[FETCH-MAILBOX] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
