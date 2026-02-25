import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
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

    // Optional: get last_checked timestamp from query params
    const url = new URL(req.url)
    const lastChecked = url.searchParams.get('last_checked')

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

    // Cleanup stale accepted requests (>1h without acknowledge) — zero trace policy
    const oneHourAgo = new Date(Date.now() - 60 * 60 * 1000).toISOString()
    await supabaseAdmin
      .from('contact_requests')
      .delete()
      .eq('status', 'accepted')
      .lt('responded_at', oneHourAgo)

    // Cleanup expired pending requests (opportunistic)
    await supabaseAdmin
      .from('contact_requests')
      .delete()
      .eq('status', 'pending')
      .lt('expires_at', new Date().toISOString())

    // Build the query
    let query = supabaseAdmin
      .from('contact_requests')
      .select('*')
      .eq('requester_id', userId)
      .eq('status', 'accepted')

    // If last_checked is provided, only get requests accepted after that time
    if (lastChecked) {
      query = query.gt('responded_at', lastChecked)
    }

    const { data: requests, error } = await query.order('responded_at', { ascending: false })

    if (error) {
      console.error('[GET-ACCEPTED-REQUESTS] Query error:', error)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de la récupération des demandes' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Format the response with the acceptor's crypto keys and Zero-Knowledge tokens
    // send_token_for_requester is stored on the row by accept-contact-request
    // send_token_for_acceptor was already returned to the acceptor in the accept response
    const formattedRequests = (requests || []).map((r: any) => ({
      id: r.id,
      recipient_hash_id: r.recipient_hash_id,
      responded_at: r.responded_at,
      acceptor: {
        user_id: r.recipient_id,
        hash_id: r.recipient_hash_id,
        identity_public_key: r.acceptor_identity_public_key,
        signed_prekey_public: r.acceptor_signed_prekey_public,
        signed_prekey_signature: r.acceptor_signed_prekey_signature,
        signed_prekey_id: r.acceptor_signed_prekey_id,
        prekey_id: r.acceptor_prekey_id,
        prekey_public: r.acceptor_prekey_public,
        mailbox_token: r.acceptor_mailbox_token,
        relay_token: r.acceptor_relay_token,
        sealed_sender_public_key: r.acceptor_sealed_sender_public_key
      },
      // Send token for the requester to send messages to the acceptor's mailbox
      send_token_for_requester: r.send_token_for_requester,
    }))

    console.log('[GET-ACCEPTED-REQUESTS] requêtes récupérées')

    return new Response(
      JSON.stringify({
        success: true,
        requests: formattedRequests,
        timestamp: new Date().toISOString()
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[GET-ACCEPTED-REQUESTS] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
