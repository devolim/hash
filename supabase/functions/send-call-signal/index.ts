import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Rate limiting for call signals
const RATE_LIMIT_CONFIG = {
  maxAttempts: 200,    // 200 signals max (ICE candidates can be numerous)
  windowMinutes: 10,   // Per 10 minutes
  blockMinutes: 15     // Blocked 15min if exceeded
}

/**
 * Get OAuth2 access token from Firebase service account.
 */
async function getFirebaseAccessToken(): Promise<string | null> {
  const serviceAccountJson = Deno.env.get('FIREBASE_SERVICE_ACCOUNT')

  if (!serviceAccountJson) {
    console.warn('[FCM] FIREBASE_SERVICE_ACCOUNT not configured')
    return null
  }

  try {
    const serviceAccount = JSON.parse(serviceAccountJson)

    const header = { alg: 'RS256', typ: 'JWT' }
    const now = Math.floor(Date.now() / 1000)
    const claims = {
      iss: serviceAccount.client_email,
      scope: 'https://www.googleapis.com/auth/firebase.messaging',
      aud: 'https://oauth2.googleapis.com/token',
      iat: now,
      exp: now + 3600
    }

    const base64url = (obj: unknown) => {
      const json = JSON.stringify(obj)
      const base64 = btoa(json)
      return base64.replace(/\+/g, '-').replace(/\//g, '_').replace(/=/g, '')
    }

    const headerB64 = base64url(header)
    const claimsB64 = base64url(claims)
    const unsignedToken = `${headerB64}.${claimsB64}`

    const privateKeyPem = serviceAccount.private_key
    const pemContents = privateKeyPem
      .replace('-----BEGIN PRIVATE KEY-----', '')
      .replace('-----END PRIVATE KEY-----', '')
      .replace(/\n/g, '')

    const binaryKey = Uint8Array.from(atob(pemContents), c => c.charCodeAt(0))

    const cryptoKey = await crypto.subtle.importKey(
      'pkcs8',
      binaryKey,
      { name: 'RSASSA-PKCS1-v1_5', hash: 'SHA-256' },
      false,
      ['sign']
    )

    const signature = await crypto.subtle.sign(
      'RSASSA-PKCS1-v1_5',
      cryptoKey,
      new TextEncoder().encode(unsignedToken)
    )

    const signatureB64 = btoa(String.fromCharCode(...new Uint8Array(signature)))
      .replace(/\+/g, '-').replace(/\//g, '_').replace(/=/g, '')

    const jwt = `${unsignedToken}.${signatureB64}`

    const tokenResponse = await fetch('https://oauth2.googleapis.com/token', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: `grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion=${jwt}`
    })

    if (!tokenResponse.ok) {
      const error = await tokenResponse.text()
      console.error('[FCM] Token exchange failed:', error)
      return null
    }

    const tokenData = await tokenResponse.json()
    return tokenData.access_token
  } catch (e) {
    console.error('[FCM] Error getting access token:', e)
    return null
  }
}

/**
 * Send FCM notification for incoming call.
 *
 * Strategy:
 * - Android: Data-only notification with high priority → wakes app to handle call
 * - iOS: VoIP push or high-priority alert notification
 */
async function sendCallNotification(
  fcmToken: string,
  platform: string,
  signalId: string,
  callType: string = 'audio',
  callerHashId?: string,
  callId?: string
): Promise<void> {
  const accessToken = await getFirebaseAccessToken()

  if (!accessToken) {
    console.warn('[FCM] No access token, skipping call notification')
    return
  }

  const serviceAccountJson = Deno.env.get('FIREBASE_SERVICE_ACCOUNT')
  const serviceAccount = JSON.parse(serviceAccountJson!)
  const projectId = serviceAccount.project_id

  const data: Record<string, string> = {
    type: 'incoming_call',
    signal_id: signalId,
    call_type: callType,
    timestamp: new Date().toISOString(),
  }
  if (callerHashId) {
    data.caller_hash_id = callerHashId
  }
  if (callId) {
    data.call_id = callId
  }

  const messagePayload: Record<string, unknown> = {
    token: fcmToken,
    data
  }

  if (platform === 'android') {
    // Android: High-priority data notification to wake up the app
    messagePayload.android = {
      priority: 'high',
      ttl: '30s' // Call signals expire quickly
    }
  } else if (platform === 'ios') {
    // iOS: Data-only high-priority push — NO notification payload.
    // The notification field would create a visible system notification
    // on top of the CallKit screen (duplicate). Instead, we use
    // content-available to wake the app, and the background handler
    // shows CallKit natively.
    messagePayload.apns = {
      headers: {
        'apns-priority': '10',
        'apns-push-type': 'alert',
        'apns-expiration': String(Math.floor(Date.now() / 1000) + 30) // 30s TTL
      },
      payload: {
        aps: {
          'content-available': 1,
          sound: 'default'
        }
      }
    }
  }

  const message = { message: messagePayload }

  const response = await fetch(
    `https://fcm.googleapis.com/v1/projects/${projectId}/messages:send`,
    {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${accessToken}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(message)
    }
  )

  if (!response.ok) {
    const errorText = await response.text()
    throw new Error(`FCM V1 error: ${response.status} - ${errorText}`)
  }

  const result = await response.json()
  console.log('[FCM] notification d appel envoyée')
}

/**
 * Send anonymous WebRTC signaling data.
 *
 * Like sealed sender for messages, call signaling is also anonymous:
 * - No authentication required (caller identity is in encrypted payload)
 * - Rate limited by IP only
 * - Signal payload is encrypted with recipient's sealed sender key
 * - Caller identity revealed only to recipient after decryption
 *
 * Signal types (all encrypted):
 * - offer: SDP offer to initiate call
 * - answer: SDP answer accepting call
 * - ice: ICE candidate for NAT traversal
 * - hangup: End call signal
 *
 * Signals expire after 30 seconds (calls are real-time).
 */
serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const body = await req.json()
    const {
      recipient_mailbox_token,  // Callee's anonymous mailbox token
      encrypted_signal,         // Encrypted signal data (SDP/ICE + caller identity)
      encrypted_signal_type,    // DEPRECATED: kept for backwards compat, ignored if notify is present
      notify,                   // Boolean: whether to send a push notification (opaque - server doesn't know signal type)
      notification_relay_token, // Optional: To ring the callee's device
      call_type,                // Optional: 'audio' or 'video' (for notification display)
      caller_hash_id,           // Optional: Caller's public hash ID (for CallKit name resolution)
      send_token,               // Optional: Authorization token for this mailbox
      call_id                   // Optional: Call UUID for early audio connect (not a secret)
    } = body

    // Validation
    if (!recipient_mailbox_token || typeof recipient_mailbox_token !== 'string' || recipient_mailbox_token.length !== 64) {
      return new Response(
        JSON.stringify({ error: 'recipient_mailbox_token invalide', error_code: 'INVALID_MAILBOX_TOKEN' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!encrypted_signal || typeof encrypted_signal !== 'string') {
      return new Response(
        JSON.stringify({ error: 'encrypted_signal requis', error_code: 'MISSING_SIGNAL' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // encrypted_signal_type is now optional (opaque signaling)
    // The server stores it as a blob without interpreting it

    // Validate signal size (SDP can be large, up to 50KB)
    try {
      const decodedSize = atob(encrypted_signal).length
      if (decodedSize > 50 * 1024) { // 50KB max
        return new Response(
          JSON.stringify({ error: 'Signal trop volumineux (max 50KB)', error_code: 'MESSAGE_TOO_LARGE' }),
          { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
      }
    } catch {
      return new Response(
        JSON.stringify({ error: 'encrypted_signal invalide (base64 attendu)', error_code: 'INVALID_SIGNAL' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      { auth: { autoRefreshToken: false, persistSession: false } }
    )

    const clientIP = getClientIP(req)

    // Rate limiting by IP only (anonymous signaling)
    const ipCheck = await checkRateLimit(
      supabaseAdmin, `ip:${clientIP}`, 'call_signal', RATE_LIMIT_CONFIG
    )
    if (!ipCheck.allowed) {
      console.log('[SEND-CALL-SIGNAL] rate limit IP')
      return new Response(
        JSON.stringify({ error: ipCheck.message, error_code: 'RATE_LIMITED' }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Verify the recipient mailbox exists
    const { data: mailbox, error: mailboxError } = await supabaseAdmin
      .from('mailboxes')
      .select('id')
      .eq('mailbox_token', recipient_mailbox_token)
      .eq('is_active', true)
      .single()

    if (mailboxError || !mailbox) {
      return new Response(
        JSON.stringify({ error: 'Destinataire non trouvé', error_code: 'RECIPIENT_NOT_FOUND' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Verify send_token authorization
    const { data: activeTokens } = await supabaseAdmin
      .from('mailbox_send_tokens')
      .select('id')
      .eq('mailbox_token', recipient_mailbox_token)
      .eq('is_active', true)
      .limit(1)

    if (activeTokens && activeTokens.length > 0) {
      if (!send_token || typeof send_token !== 'string') {
        return new Response(
          JSON.stringify({ error: 'invalid_send_token', error_code: 'INVALID_SEND_TOKEN' }),
          { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
      }

      const tokenHash = await crypto.subtle.digest(
        'SHA-256',
        new TextEncoder().encode(send_token)
      ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

      const { data: validToken } = await supabaseAdmin
        .from('mailbox_send_tokens')
        .select('id')
        .eq('mailbox_token', recipient_mailbox_token)
        .eq('send_token_hash', tokenHash)
        .eq('is_active', true)
        .single()

      if (!validToken) {
        return new Response(
          JSON.stringify({ error: 'invalid_send_token', error_code: 'INVALID_SEND_TOKEN' }),
          { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
      }
    }

    // Store the call signal (expires in 30 seconds)
    const expiresAt = new Date(Date.now() + 30 * 1000).toISOString()

    const { data: newSignal, error: insertError } = await supabaseAdmin
      .from('call_signals')
      .insert({
        recipient_mailbox_token,
        encrypted_signal,
        encrypted_signal_type: encrypted_signal_type || 'opaque',
        expires_at: expiresAt,
        is_consumed: false
      })
      .select('id, created_at')
      .single()

    if (insertError) {
      console.error('[SEND-CALL-SIGNAL] Insert error:', insertError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de l\'envoi du signal', error_code: 'INSERT_ERROR' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Send push notification if client requests it (opaque: server doesn't know signal type)
    const shouldNotify = notify === true || (notify === undefined && notification_relay_token)
    if (shouldNotify && notification_relay_token) {
      try {
        const { data: relay } = await supabaseAdmin
          .from('notification_relays')
          .select('fcm_token, platform, encrypted_push_token, encrypted_platform')
          .eq('relay_token', notification_relay_token)
          .eq('is_active', true)
          .single()

        if (relay && relay.fcm_token) {
          // Send FCM notification to wake up the recipient's device
          await sendCallNotification(
            relay.fcm_token,
            relay.platform || 'android',
            newSignal.id,
            call_type || 'audio',
            caller_hash_id,
            call_id
          )
          console.log('[SEND-CALL-SIGNAL] notification d appel envoyée')
        } else if (relay) {
          // Legacy encrypted mode - log for now
          console.log('[SEND-CALL-SIGNAL] relay legacy')
        }
      } catch (notifError) {
        // Silently fail notification - signal is still stored
        console.error(`[SEND-CALL-SIGNAL] Notification error:`, notifError)
      }
    }

    console.log('[SEND-CALL-SIGNAL] signal stocké')

    return new Response(
      JSON.stringify({
        success: true,
        signal_id: newSignal.id,
        timestamp: newSignal.created_at,
        expires_at: expiresAt
      }),
      { status: 201, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[SEND-CALL-SIGNAL] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne', error_code: 'INTERNAL_ERROR' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
