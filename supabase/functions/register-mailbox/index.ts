import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

/**
 * Register an anonymous mailbox for the user.
 *
 * The mailbox_token is derived client-side using:
 * mailbox_token = HKDF(identity_private_key, "mailbox_v1", rotation_counter)
 *
 * The server cannot correlate mailbox_token to user identity without the private key.
 * This enables sealed sender: senders only know the recipient's mailbox_token.
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
      mailbox_token,           // Anonymous token derived client-side
      sealed_sender_public_key, // Curve25519 public key for sealed sender encryption
      rotation_counter = 0,     // Rotation counter (0 for initial registration)
      relay_token               // Optional: notification relay token (also derived client-side)
    } = body

    // Validation
    if (!mailbox_token || typeof mailbox_token !== 'string' || mailbox_token.length !== 64) {
      return new Response(
        JSON.stringify({ error: 'mailbox_token invalide (64 caractères hex attendus)' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!sealed_sender_public_key || typeof sealed_sender_public_key !== 'string') {
      return new Response(
        JSON.stringify({ error: 'sealed_sender_public_key requis' }),
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

    // Check if token already exists (to prevent hijacking)
    const { data: existingMailbox } = await supabaseAdmin
      .from('mailboxes')
      .select('id, user_id')
      .eq('mailbox_token', mailbox_token)
      .single()

    if (existingMailbox) {
      if (existingMailbox.user_id !== userId) {
        // Someone else already registered this token - possible attack or collision
        console.error('[REGISTER-MAILBOX] collision ou attaque de token')
        return new Response(
          JSON.stringify({ error: 'Token déjà utilisé' }),
          { status: 409, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
      }
      // Same user re-registering - update the mailbox
      const { error: updateError } = await supabaseAdmin
        .from('mailboxes')
        .update({
          sealed_sender_public_key,
          rotation_counter,
          is_active: true,
          expires_at: new Date(Date.now() + 90 * 24 * 60 * 60 * 1000).toISOString() // 90 days
        })
        .eq('id', existingMailbox.id)

      if (updateError) {
        console.error('[REGISTER-MAILBOX] Update error:', updateError)
        return new Response(
          JSON.stringify({ error: 'Erreur lors de la mise à jour' }),
          { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
      }

      // Also update users table for contact request flow
      const userUpdate: Record<string, unknown> = {
        mailbox_token,
        sealed_sender_public_key,
        mailbox_rotation_counter: rotation_counter
      }
      // Include relay_token if provided (for push notification routing to contacts)
      if (relay_token && typeof relay_token === 'string' && relay_token.length === 64) {
        userUpdate.relay_token = relay_token
      }
      await supabaseAdmin
        .from('users')
        .update(userUpdate)
        .eq('id', userId)

      console.log('[REGISTER-MAILBOX] mailbox mis à jour')
      return new Response(
        JSON.stringify({
          success: true,
          updated: true,
          mailbox_token: mailbox_token
        }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Deactivate any previous mailboxes for this user
    await supabaseAdmin
      .from('mailboxes')
      .update({ is_active: false })
      .eq('user_id', userId)
      .eq('is_active', true)

    // Create new mailbox
    const expiresAt = new Date(Date.now() + 90 * 24 * 60 * 60 * 1000).toISOString() // 90 days

    const { data: newMailbox, error: insertError } = await supabaseAdmin
      .from('mailboxes')
      .insert({
        mailbox_token,
        user_id: userId,
        sealed_sender_public_key,
        rotation_counter,
        expires_at: expiresAt,
        is_active: true
      })
      .select('id')
      .single()

    if (insertError) {
      console.error('[REGISTER-MAILBOX] Insert error:', insertError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de l\'enregistrement' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Also update users table for contact request flow
    const userUpdateNew: Record<string, unknown> = {
      mailbox_token,
      sealed_sender_public_key,
      mailbox_rotation_counter: rotation_counter
    }
    // Include relay_token if provided (for push notification routing to contacts)
    if (relay_token && typeof relay_token === 'string' && relay_token.length === 64) {
      userUpdateNew.relay_token = relay_token
    }
    await supabaseAdmin
      .from('users')
      .update(userUpdateNew)
      .eq('id', userId)

    console.log('[REGISTER-MAILBOX] mailbox créé')

    return new Response(
      JSON.stringify({
        success: true,
        created: true,
        mailbox_token: mailbox_token,
        expires_at: expiresAt
      }),
      { status: 201, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[REGISTER-MAILBOX] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
