import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

/**
 * Reset device — clean up an old account so the device can re-register.
 *
 * When a user reinstalls the app, Supabase may still have the old account.
 * This function deletes all server-side data and the auth user,
 * allowing a fresh register.
 *
 * Input: JWT (session from the old account, restored by Supabase)
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

    console.log('[RESET-DEVICE] suppression en cours')

    // Delete all user data
    // 1. Send tokens associated with user's mailboxes
    const { data: userMailboxes } = await supabaseAdmin
      .from('mailboxes')
      .select('mailbox_token')
      .eq('user_id', userId)
    if (userMailboxes) {
      for (const mb of userMailboxes) {
        await supabaseAdmin.from('mailbox_send_tokens').delete().eq('mailbox_token', mb.mailbox_token)
      }
    }

    // 2. Mailboxes
    await supabaseAdmin.from('mailboxes').delete().eq('user_id', userId)

    // 3. Prekeys
    await supabaseAdmin.from('prekeys').delete().eq('user_id', userId)

    // 4. Temporary codes
    await supabaseAdmin.from('temporary_codes').delete().eq('user_id', userId)

    // 5. Rate limits
    await supabaseAdmin.from('rate_limits').delete().eq('identifier', `user:${userId}`)

    // 6. Contact requests (both directions)
    await supabaseAdmin.from('contact_requests').delete().eq('requester_id', userId)
    await supabaseAdmin.from('contact_requests').delete().eq('recipient_id', userId)

    // 7. Notification relays (via user's relay from users table)
    // We can't link directly since relays are anonymous, but the user row has the token
    const { data: userData } = await supabaseAdmin
      .from('users')
      .select('relay_token')
      .eq('id', userId)
      .single()
    if (userData?.relay_token) {
      await supabaseAdmin.from('notification_relays').delete().eq('relay_token', userData.relay_token)
    }

    // 8. Users table
    await supabaseAdmin.from('users').delete().eq('id', userId)

    // 9. Auth user
    await supabaseAdmin.auth.admin.deleteUser(userId)

    console.log('[RESET-DEVICE] compte réinitialisé')

    return new Response(
      JSON.stringify({ success: true }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[RESET-DEVICE] erreur:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
