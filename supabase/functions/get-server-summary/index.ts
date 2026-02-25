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

    const session = await validateSessionStrict(supabaseAdmin, authHeader, supabaseUser)
    if (!session.valid || !session.userId) {
      return new Response(
        JSON.stringify({ error: session.error ?? 'Session invalide' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const userId = session.userId

    // 1. Profil utilisateur (inclut mailbox_token pour les sealed_messages)
    const { data: userProfile, error: profileError } = await supabaseAdmin
      .from('users')
      .select('hash_id, created_at, identity_public_key, signed_prekey_id, mailbox_token, mailbox_rotation_counter')
      .eq('id', userId)
      .single()

    if (profileError || !userProfile) {
      console.error('[GET-SERVER-SUMMARY] profil introuvable:', profileError)
      return new Response(
        JSON.stringify({ error: 'Profil introuvable' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // 2. Toutes les autres requêtes en parallèle
    const [
      prekeyResult,
      sealedMsgResult,
      sentReqResult,
      receivedReqResult,
      relayResult,
      mailboxResult,
    ] = await Promise.all([
      // Prekeys restantes
      supabaseAdmin
        .from('prekeys')
        .select('*', { count: 'exact', head: true })
        .eq('user_id', userId),

      // Messages scellés en attente dans la mailbox
      supabaseAdmin
        .from('sealed_messages')
        .select('*', { count: 'exact', head: true })
        .eq('recipient_mailbox_token', userProfile.mailbox_token)
        .eq('is_delivered', false),

      // Demandes de contact envoyées en attente
      supabaseAdmin
        .from('contact_requests')
        .select('*', { count: 'exact', head: true })
        .eq('sender_id', userId)
        .eq('status', 'pending'),

      // Demandes de contact reçues en attente
      supabaseAdmin
        .from('contact_requests')
        .select('*', { count: 'exact', head: true })
        .eq('recipient_id', userId)
        .eq('status', 'pending'),

      // Relay de notification actif
      supabaseAdmin
        .from('notification_relays')
        .select('*', { count: 'exact', head: true })
        .eq('user_id', userId)
        .eq('is_active', true),

      // Mailbox active (rotation counter + expiration)
      supabaseAdmin
        .from('mailboxes')
        .select('rotation_counter, expires_at')
        .eq('user_id', userId)
        .eq('is_active', true)
        .single(),
    ])

    // Tronquer la clé d'identité pour l'affichage (jamais envoyer la clé complète)
    const fullKey = userProfile.identity_public_key ?? ''
    const truncatedKey = fullKey.length > 12
      ? `${fullKey.slice(0, 8)}...${fullKey.slice(-4)}`
      : fullKey

    return new Response(
      JSON.stringify({
        profile: {
          hash_id: userProfile.hash_id,
          created_at: userProfile.created_at,
          identity_key_truncated: truncatedKey,
          signed_prekey_id: userProfile.signed_prekey_id,
          mailbox_rotation_counter: userProfile.mailbox_rotation_counter ?? 0,
        },
        prekeys: {
          count: prekeyResult.count ?? 0,
        },
        mailbox: {
          pending_count: sealedMsgResult.count ?? 0,
          rotation_counter: mailboxResult.data?.rotation_counter ?? 0,
          expires_at: mailboxResult.data?.expires_at ?? null,
        },
        contacts: {
          sent_pending: sentReqResult.count ?? 0,
          received_pending: receivedReqResult.count ?? 0,
        },
        notifications: {
          active_relay: (relayResult.count ?? 0) > 0,
        },
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[GET-SERVER-SUMMARY] Erreur inattendue:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
