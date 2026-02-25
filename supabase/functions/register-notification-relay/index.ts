import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Rate limiting
const RATE_LIMIT_CONFIG = {
  maxAttempts: 10,     // 10 registrations max
  windowMinutes: 60,   // Per hour
  blockMinutes: 30     // Blocked 30min if exceeded
}

/**
 * Register an ANONYMOUS notification relay.
 *
 * ZERO-KNOWLEDGE: The server does NOT know who owns this relay.
 * - No user_id stored
 * - No authentication required (relay_token is the secret)
 * - Only rate limiting by IP to prevent abuse
 *
 * The relay_token is derived client-side from the user's private key.
 * Only someone with the private key can compute this token.
 * The server cannot link a relay_token to any user identity.
 *
 * Flow:
 * 1. Client derives relay_token from their identity private key
 * 2. Client registers relay_token + fcm_token (anonymous)
 * 3. When sending a message, sender includes recipient's relay_token
 * 4. Server sends push notification to the fcm_token associated with relay_token
 * 5. Server CANNOT know who received the notification
 */
serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const body = await req.json()
    const {
      relay_token,   // Anonymous relay identifier (derived from private key)
      fcm_token,     // FCM/APNs token for push notifications
      platform       // Platform: 'android' or 'ios'
    } = body

    // Validation
    if (!relay_token || typeof relay_token !== 'string' || relay_token.length !== 64) {
      return new Response(
        JSON.stringify({ error: 'relay_token invalide (64 caractères hex attendus)' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!fcm_token || typeof fcm_token !== 'string') {
      return new Response(
        JSON.stringify({ error: 'fcm_token requis' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (platform !== 'android' && platform !== 'ios') {
      return new Response(
        JSON.stringify({ error: 'platform doit être "android" ou "ios"' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      { auth: { autoRefreshToken: false, persistSession: false } }
    )

    const clientIP = getClientIP(req)

    // Rate limiting by IP (no user auth for anonymous registration)
    const ipCheck = await checkRateLimit(
      supabaseAdmin, `ip:${clientIP}`, 'notification_relay', RATE_LIMIT_CONFIG
    )
    if (!ipCheck.allowed) {
      console.log('[REGISTER-NOTIFICATION-RELAY] rate limit IP')
      return new Response(
        JSON.stringify({ error: ipCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Check if relay token already exists
    const { data: existingRelay } = await supabaseAdmin
      .from('notification_relays')
      .select('id')
      .eq('relay_token', relay_token)
      .single()

    if (existingRelay) {
      // Update existing relay (the person knows the relay_token, so they own it)
      const { error: updateError } = await supabaseAdmin
        .from('notification_relays')
        .update({
          fcm_token,
          platform,
          is_active: true
        })
        .eq('id', existingRelay.id)

      if (updateError) {
        console.error('[REGISTER-NOTIFICATION-RELAY] Update error:', updateError)
        return new Response(
          JSON.stringify({ error: 'Erreur lors de la mise à jour' }),
          { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
      }

      // Deactivate other relays with the same fcm_token (orphans from old accounts)
      await supabaseAdmin
        .from('notification_relays')
        .update({ is_active: false })
        .eq('fcm_token', fcm_token)
        .neq('id', existingRelay.id)

      console.log('[REGISTER-NOTIFICATION-RELAY] relay mis à jour')

      return new Response(
        JSON.stringify({
          success: true,
          updated: true
        }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Deactivate any existing relays with the same fcm_token (device changed account)
    await supabaseAdmin
      .from('notification_relays')
      .update({ is_active: false })
      .eq('fcm_token', fcm_token)

    // Create new relay (anonymous - no user_id!)
    const { error: insertError } = await supabaseAdmin
      .from('notification_relays')
      .insert({
        relay_token,
        fcm_token,
        platform,
        is_active: true
      })

    if (insertError) {
      console.error('[REGISTER-NOTIFICATION-RELAY] Insert error:', insertError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de l\'enregistrement' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log('[REGISTER-NOTIFICATION-RELAY] relay anonyme créé')

    return new Response(
      JSON.stringify({
        success: true,
        created: true
      }),
      { status: 201, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[REGISTER-NOTIFICATION-RELAY] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
