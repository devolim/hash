import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

/**
 * Fetch call signals from an anonymous mailbox.
 *
 * Used to receive:
 * - Incoming call offers (ring!)
 * - Call answers
 * - ICE candidates for NAT traversal
 * - Hangup signals
 *
 * Signals are marked as consumed after fetch and auto-deleted.
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
    const {
      mailbox_token,    // User's anonymous mailbox token
      since,            // Optional: Only fetch signals after this timestamp
      limit = 50        // Max signals to fetch
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
      console.error('[FETCH-CALL-SIGNALS] accès non autorisé')
      return new Response(
        JSON.stringify({ error: 'Accès non autorisé' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Build query for signals
    let query = supabaseAdmin
      .from('call_signals')
      .select('id, encrypted_signal, encrypted_signal_type, created_at')
      .eq('recipient_mailbox_token', mailbox_token)
      .eq('is_consumed', false)
      .order('created_at', { ascending: true })
      .limit(Math.min(limit, 100))

    if (since) {
      query = query.gt('created_at', since)
    }

    const { data: signals, error: signalsError } = await query

    if (signalsError) {
      console.error('[FETCH-CALL-SIGNALS] Error fetching signals:', signalsError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de la récupération des signaux' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Mark signals as consumed and delete them
    if (signals && signals.length > 0) {
      const signalIds = signals.map(s => s.id)

      // Delete immediately (signals are ephemeral)
      await supabaseAdmin
        .from('call_signals')
        .delete()
        .in('id', signalIds)
    }

    // Format response
    const formattedSignals = signals?.map(s => ({
      id: s.id,
      encrypted_signal: s.encrypted_signal,
      encrypted_signal_type: s.encrypted_signal_type,
      timestamp: s.created_at
    })) || []

    console.log(`[FETCH-CALL-SIGNALS] Returned ${formattedSignals.length} signals for mailbox`)

    return new Response(
      JSON.stringify({
        success: true,
        signals: formattedSignals,
        count: formattedSignals.length
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[FETCH-CALL-SIGNALS] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
