import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Configuration du rate limiting pour la suppression de compte
// Très restrictif car action irréversible
const RATE_LIMIT_CONFIG = {
  maxAttempts: 3,      // 3 tentatives max
  windowMinutes: 60,   // Par heure
  blockMinutes: 1440   // Bloqué 24h si dépassé
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

    // Créer les clients Supabase
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

    // Validation stricte de la session (vérifie session_valid_after après transfert)
    const sessionCheck = await validateSessionStrict(supabaseAdmin, authHeader, supabaseUser)
    if (!sessionCheck.valid) {
      return new Response(
        JSON.stringify({ error: sessionCheck.error || 'Session invalide' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const userId = sessionCheck.userId!
    const clientIP = getClientIP(req)

    // Rate limiting par IP ET par userId
    const ipCheck = await checkRateLimit(
      supabaseAdmin,
      `ip:${clientIP}`,
      'delete_account',
      RATE_LIMIT_CONFIG
    )

    if (!ipCheck.allowed) {
      console.log('[DELETE-ACCOUNT] rate limit IP')
      return new Response(
        JSON.stringify({ error: ipCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const userCheck = await checkRateLimit(
      supabaseAdmin,
      `user:${userId}`,
      'delete_account',
      RATE_LIMIT_CONFIG
    )

    if (!userCheck.allowed) {
      console.log('[DELETE-ACCOUNT] rate limit utilisateur')
      return new Response(
        JSON.stringify({ error: userCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Vérifier que l'utilisateur existe
    const { data: userData, error: userError } = await supabaseAdmin
      .from('users')
      .select('id, hash_id, device_id')
      .eq('id', userId)
      .single()

    if (userError || !userData) {
      return new Response(
        JSON.stringify({ error: 'Utilisateur non trouvé' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // ============================================================
    // SUPPRESSION COMPLÈTE DU COMPTE
    // ============================================================

    console.log('[DELETE-ACCOUNT] suppression en cours')

    // 1. Supprimer les messages en attente
    await supabaseAdmin.from('pending_messages').delete().eq('recipient_id', userId)
    await supabaseAdmin.from('pending_messages').delete().eq('sender_id', userId)

    // 2. Supprimer les send tokens et sealed messages associés aux mailboxes
    const { data: userMailboxes } = await supabaseAdmin
      .from('mailboxes')
      .select('mailbox_token')
      .eq('user_id', userId)
    if (userMailboxes) {
      for (const mb of userMailboxes) {
        await supabaseAdmin.from('sealed_messages').delete().eq('recipient_mailbox_token', mb.mailbox_token)
        await supabaseAdmin.from('mailbox_send_tokens').delete().eq('mailbox_token', mb.mailbox_token)
      }
    }

    // 3. Supprimer les mailboxes
    await supabaseAdmin.from('mailboxes').delete().eq('user_id', userId)

    // 4. Supprimer les prekeys
    await supabaseAdmin.from('prekeys').delete().eq('user_id', userId)

    // 5. Supprimer les codes temporaires
    await supabaseAdmin.from('temporary_codes').delete().eq('user_id', userId)

    // 6. Supprimer les contact requests (les deux directions)
    await supabaseAdmin.from('contact_requests').delete().eq('requester_id', userId)
    await supabaseAdmin.from('contact_requests').delete().eq('recipient_id', userId)

    // 7. Supprimer les médias et quota
    const { data: userDataForRelay } = await supabaseAdmin
      .from('users')
      .select('relay_token')
      .eq('id', userId)
      .single()

    // Anonymiser le userId pour retrouver les médias (même logique que upload-media)
    const encoder = new TextEncoder()
    const keyData = encoder.encode(Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '')
    const hmacKey = await crypto.subtle.importKey(
      'raw', keyData, { name: 'HMAC', hash: 'SHA-256' }, false, ['sign']
    )
    const signature = await crypto.subtle.sign('HMAC', hmacKey, encoder.encode(userId))
    const anonId = Array.from(new Uint8Array(signature))
      .map(b => b.toString(16).padStart(2, '0'))
      .join('')

    // Supprimer les fichiers du storage
    const { data: mediaFiles } = await supabaseAdmin
      .from('media_files')
      .select('storage_path')
      .eq('uploader_id', anonId)
    if (mediaFiles && mediaFiles.length > 0) {
      await supabaseAdmin.storage.from('media').remove(mediaFiles.map(f => f.storage_path))
    }
    await supabaseAdmin.from('media_files').delete().eq('uploader_id', anonId)
    await supabaseAdmin.from('user_media_quota').delete().eq('uploader_id', anonId)

    // 8. Supprimer le notification relay
    if (userDataForRelay?.relay_token) {
      await supabaseAdmin.from('notification_relays').delete().eq('relay_token', userDataForRelay.relay_token)
    }

    // 9. Supprimer les rate limits de cet utilisateur
    await supabaseAdmin.from('rate_limits').delete().eq('identifier', `user:${userId}`)

    // 6. Supprimer l'utilisateur de la table users
    const { error: deleteUserError } = await supabaseAdmin
      .from('users')
      .delete()
      .eq('id', userId)

    if (deleteUserError) {
      console.error('[DELETE-ACCOUNT] erreur suppression utilisateur')
      return new Response(
        JSON.stringify({ error: 'Erreur lors de la suppression' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // 7. Supprimer l'utilisateur de auth.users (Supabase Auth)
    const { error: deleteAuthError } = await supabaseAdmin.auth.admin.deleteUser(userId)

    if (deleteAuthError) {
      console.error('[DELETE-ACCOUNT] erreur suppression auth')
      // On continue quand même, l'utilisateur est déjà supprimé de la table users
    }

    console.log('[DELETE-ACCOUNT] compte supprimé')

    return new Response(
      JSON.stringify({
        success: true,
        message: 'Compte supprimé définitivement',
        hash_id: userData.hash_id,
        timestamp: new Date().toISOString()
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[DELETE-ACCOUNT] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
