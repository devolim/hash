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

    const body = await req.json()
    const { request_id } = body

    if (!request_id || typeof request_id !== 'string') {
      return new Response(
        JSON.stringify({ error: 'request_id invalide' }),
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

    // Get the request and verify the user is the recipient
    const { data: request, error: requestError } = await supabaseAdmin
      .from('contact_requests')
      .select('*')
      .eq('id', request_id)
      .single()

    if (requestError || !request) {
      return new Response(
        JSON.stringify({ error: 'Demande non trouvée' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Verify the user is the recipient
    if (request.recipient_id !== userId) {
      return new Response(
        JSON.stringify({ error: 'Non autorisé' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Verify the request is still pending
    if (request.status !== 'pending') {
      return new Response(
        JSON.stringify({ error: 'Cette demande a déjà été traitée' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Verify the request hasn't expired
    if (new Date(request.expires_at) < new Date()) {
      return new Response(
        JSON.stringify({ error: 'Cette demande a expiré' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Get acceptor's keys (including Zero-Knowledge tokens)
    const { data: acceptorData, error: acceptorError } = await supabaseAdmin
      .from('users')
      .select('id, hash_id, identity_public_key, signed_prekey_public, signed_prekey_signature, signed_prekey_id, mailbox_token, relay_token, sealed_sender_public_key')
      .eq('id', userId)
      .single()

    if (acceptorError || !acceptorData) {
      return new Response(
        JSON.stringify({ error: 'Erreur lors de la récupération des données utilisateur' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Get and consume one prekey from the acceptor
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

    // Generate a send_token for the requester to send messages to the acceptor's mailbox
    const sendTokenForRequester = crypto.randomUUID()

    // Update the request with acceptor's keys, status, and send_token
    const { error: updateError } = await supabaseAdmin
      .from('contact_requests')
      .update({
        status: 'accepted',
        responded_at: new Date().toISOString(),
        // Signal Protocol keys
        acceptor_identity_public_key: acceptorData.identity_public_key,
        acceptor_signed_prekey_public: acceptorData.signed_prekey_public,
        acceptor_signed_prekey_signature: acceptorData.signed_prekey_signature,
        acceptor_signed_prekey_id: acceptorData.signed_prekey_id,
        acceptor_prekey_id: prekey.prekey_id,
        acceptor_prekey_public: prekey.public_key,
        // Zero-Knowledge tokens (for sealed sender messaging)
        acceptor_mailbox_token: acceptorData.mailbox_token,
        acceptor_relay_token: acceptorData.relay_token,
        acceptor_sealed_sender_public_key: acceptorData.sealed_sender_public_key,
        // Send token for the requester (stored temporarily, deleted on acknowledge)
        send_token_for_requester: sendTokenForRequester
      })
      .eq('id', request_id)

    if (updateError) {
      console.error('[ACCEPT-CONTACT-REQUEST] erreur mise à jour:', updateError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de l\'acceptation de la demande' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }
    const sendTokenHash = await crypto.subtle.digest(
      'SHA-256',
      new TextEncoder().encode(sendTokenForRequester)
    ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

    // Register the send token for the acceptor's mailbox
    if (acceptorData.mailbox_token) {
      await supabaseAdmin
        .from('mailbox_send_tokens')
        .upsert({
          mailbox_token: acceptorData.mailbox_token,
          send_token_hash: sendTokenHash,
          is_active: true,
          created_at: new Date().toISOString(),
        }, {
          onConflict: 'mailbox_token,send_token_hash'
        })
    }

    // Also generate a send_token for the acceptor to send messages to the requester's mailbox
    let sendTokenForAcceptor: string | null = null
    if (request.requester_mailbox_token) {
      sendTokenForAcceptor = crypto.randomUUID()
      const acceptorTokenHash = await crypto.subtle.digest(
        'SHA-256',
        new TextEncoder().encode(sendTokenForAcceptor)
      ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

      await supabaseAdmin
        .from('mailbox_send_tokens')
        .upsert({
          mailbox_token: request.requester_mailbox_token,
          send_token_hash: acceptorTokenHash,
          is_active: true,
          created_at: new Date().toISOString(),
        }, {
          onConflict: 'mailbox_token,send_token_hash'
        })
    }

    console.log('[ACCEPT-CONTACT-REQUEST] demande acceptée')

    // Return both parties' data for local contact creation
    return new Response(
      JSON.stringify({
        success: true,
        request_id: request_id,
        requester: {
          user_id: request.requester_id,
          hash_id: request.requester_hash_id,
          // Signal Protocol keys
          identity_public_key: request.requester_identity_public_key,
          signed_prekey_public: request.requester_signed_prekey_public,
          signed_prekey_signature: request.requester_signed_prekey_signature,
          signed_prekey_id: request.requester_signed_prekey_id,
          prekey_id: request.requester_prekey_id,
          prekey_public: request.requester_prekey_public,
          // Zero-Knowledge tokens (for sealed sender messaging)
          mailbox_token: request.requester_mailbox_token,
          relay_token: request.requester_relay_token,
          sealed_sender_public_key: request.requester_sealed_sender_public_key
        },
        acceptor: {
          user_id: acceptorData.id,
          hash_id: acceptorData.hash_id,
          identity_public_key: acceptorData.identity_public_key,
          signed_prekey_public: acceptorData.signed_prekey_public,
          signed_prekey_signature: acceptorData.signed_prekey_signature,
          signed_prekey_id: acceptorData.signed_prekey_id,
          prekey_id: prekey.prekey_id,
          prekey_public: prekey.public_key,
          mailbox_token: acceptorData.mailbox_token,
          relay_token: acceptorData.relay_token,
          sealed_sender_public_key: acceptorData.sealed_sender_public_key
        },
        // Send token for the acceptor to send to the requester's mailbox
        send_token_for_acceptor: sendTokenForAcceptor,
        // Send token for the requester to send to the acceptor's mailbox
        send_token_for_requester: sendTokenForRequester,
        timestamp: new Date().toISOString()
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[ACCEPT-CONTACT-REQUEST] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
