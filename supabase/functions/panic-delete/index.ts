// Edge Function: delete-account
// Immediately deletes all user data - NO RECOVERY POSSIBLE
// Note: This function does NOT use validateSessionStrict because:
// - It's a destructive action that should work even if session is invalidated
// - User on old device after transfer should still be able to clean up

import { serve } from 'https://deno.land/std@0.177.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    // Verify JWT
    const authHeader = req.headers.get('Authorization')
    if (!authHeader) {
      return new Response(
        JSON.stringify({ error: 'NOT_AUTHENTICATED' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      { global: { headers: { Authorization: authHeader } } }
    )

    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      { auth: { autoRefreshToken: false, persistSession: false } }
    )

    // Get authenticated user
    const { data: { user }, error: userError } = await supabaseClient.auth.getUser()
    if (userError || !user) {
      return new Response(
        JSON.stringify({ error: 'NOT_AUTHENTICATED' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const userId = user.id

    // ============================================================
    // SUPPRESSION COMPLÈTE - Nettoyage explicite de TOUTES les tables
    // Ne PAS compter sur les CASCADE SQL
    // ============================================================

    // 1. Supprimer les messages en attente
    await supabaseAdmin.from('pending_messages').delete().eq('recipient_id', userId)
    await supabaseAdmin.from('pending_messages').delete().eq('sender_id', userId)

    // 2. Supprimer les send tokens et sealed messages des mailboxes
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

    const encoder = new TextEncoder()
    const keyData = encoder.encode(Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '')
    const hmacKey = await crypto.subtle.importKey(
      'raw', keyData, { name: 'HMAC', hash: 'SHA-256' }, false, ['sign']
    )
    const signature = await crypto.subtle.sign('HMAC', hmacKey, encoder.encode(userId))
    const anonId = Array.from(new Uint8Array(signature))
      .map(b => b.toString(16).padStart(2, '0'))
      .join('')

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

    // 9. Supprimer les rate limits
    await supabaseAdmin.from('rate_limits').delete().eq('identifier', `user:${userId}`)

    // 10. Supprimer l'utilisateur de la table users
    await supabaseAdmin.from('users').delete().eq('id', userId)

    // 11. Supprimer l'utilisateur de auth.users
    await supabaseAdmin.auth.admin.deleteUser(userId)

    // Log for security audit (without identifying info)
    console.log(`Account deleted: ${new Date().toISOString()}`)

    return new Response(
      JSON.stringify({ success: true }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('Account deletion error:', error)
    return new Response(
      JSON.stringify({ error: 'DELETE_FAILED' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
