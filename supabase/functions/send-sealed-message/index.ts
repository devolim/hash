import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Rate limiting for sending messages
const RATE_LIMIT_CONFIG = {
  maxAttempts: 100,    // 100 messages max
  windowMinutes: 60,   // Per hour
  blockMinutes: 30     // Blocked 30min if exceeded
}

/**
 * Get OAuth2 access token from Firebase service account.
 * Uses JWT authentication to get a short-lived access token.
 */
async function getFirebaseAccessToken(): Promise<string | null> {
  const serviceAccountJson = Deno.env.get('FIREBASE_SERVICE_ACCOUNT')

  if (!serviceAccountJson) {
    console.warn('[FCM] FIREBASE_SERVICE_ACCOUNT not configured')
    return null
  }

  try {
    const serviceAccount = JSON.parse(serviceAccountJson)

    // Create JWT header
    const header = {
      alg: 'RS256',
      typ: 'JWT'
    }

    // Create JWT claims
    const now = Math.floor(Date.now() / 1000)
    const claims = {
      iss: serviceAccount.client_email,
      scope: 'https://www.googleapis.com/auth/firebase.messaging',
      aud: 'https://oauth2.googleapis.com/token',
      iat: now,
      exp: now + 3600 // 1 hour
    }

    // Base64URL encode
    const base64url = (obj: unknown) => {
      const json = JSON.stringify(obj)
      const base64 = btoa(json)
      return base64.replace(/\+/g, '-').replace(/\//g, '_').replace(/=/g, '')
    }

    const headerB64 = base64url(header)
    const claimsB64 = base64url(claims)
    const unsignedToken = `${headerB64}.${claimsB64}`

    // Sign with RSA-SHA256
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

    // Exchange JWT for access token
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
 * Send a FCM notification using API V1.
 *
 * Strategy for customizable notifications:
 * - Android: Data-only notification → background handler reads local preferences and displays custom notification
 * - iOS: Notification with mutable-content → Notification Service Extension modifies it before display
 *
 * This preserves Zero-Knowledge: the server sends generic content, client personalizes locally.
 *
 * @param fcmToken - The FCM token of the recipient device
 * @param platform - 'android' or 'ios'
 * @param messageId - Unique message ID for deduplication
 * @param messageTimestamp - Message creation timestamp for stable notification ID
 */
async function sendFCMNotification(
  fcmToken: string,
  platform: string,
  messageId?: string,
  messageTimestamp?: string,
  contentHint?: string
): Promise<void> {
  const accessToken = await getFirebaseAccessToken()

  if (!accessToken) {
    console.warn('[FCM] No access token, skipping notification')
    return
  }

  const serviceAccountJson = Deno.env.get('FIREBASE_SERVICE_ACCOUNT')
  const serviceAccount = JSON.parse(serviceAccountJson!)
  const projectId = serviceAccount.project_id

  const isReceipt = contentHint === 'receipt'

  // Base message with data payload
  // Include message_id and message_timestamp for stable notification ID
  // This prevents duplicate notifications when both background handler and app process the same message
  const messagePayload: Record<string, unknown> = {
    token: fcmToken,
    data: {
      type: isReceipt ? 'receipt' : 'new_message',
      timestamp: messageTimestamp || new Date().toISOString(),
      message_id: messageId || '',
    }
  }

  // Platform-specific settings
  if (platform === 'android') {
    // Android: Data-only notification (both messages and receipts)
    // For receipts: background handler checks type != 'new_message' → no visible notification
    // The push still wakes the process so Realtime can reconnect
    messagePayload.android = {
      priority: 'high'
    }
  } else if (platform === 'ios') {
    if (isReceipt) {
      // iOS receipt: Silent push (content-available only)
      // Bypasses NSE entirely, no visible notification shown
      // Wakes the app briefly so Realtime can reconnect and process the receipt
      messagePayload.apns = {
        headers: {
          'apns-priority': '5',
          'apns-push-type': 'background'
        },
        payload: {
          aps: {
            'content-available': 1
          }
        }
      }
    } else {
      // iOS message: Notification with mutable-content
      // The Notification Service Extension will modify it before display
      messagePayload.notification = {
        title: 'Hash',
        body: 'Nouveau message'
      }
      messagePayload.apns = {
        headers: {
          'apns-priority': '10',
          'apns-push-type': 'alert'
        },
        payload: {
          aps: {
            alert: {
              title: 'Hash',
              body: 'Nouveau message'
            },
            sound: 'default',
            badge: 1,
            'mutable-content': 1  // Allows Notification Service Extension to modify
          }
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
  console.log('[FCM] notification envoyée')
}

/**
 * Send a sealed message to an anonymous mailbox.
 *
 * SEALED SENDER: The server does NOT know who is sending the message.
 * - No authentication required (anonymous sending)
 * - Only rate limiting by IP to prevent spam
 * - The sealed_envelope contains the sender identity encrypted
 * - Only the recipient can decrypt and discover the sender
 *
 * Envelope structure (encrypted):
 * - sender_certificate: Signed certificate with sender's identity
 * - encrypted_content: The actual message encrypted for the recipient
 *
 * The server only sees:
 * - recipient_mailbox_token (anonymous)
 * - sealed_envelope (opaque blob)
 * - timestamp
 */
serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    let body: Record<string, unknown>
    try {
      body = await req.json()
    } catch {
      return new Response(
        JSON.stringify({ error: 'Invalid JSON body', error_code: 'INVALID_JSON' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }
    const {
      recipient_mailbox_token,  // Anonymous recipient mailbox
      sealed_envelope,          // Base64 encoded sealed sender envelope
      notification_relay_token, // Optional: Token to trigger push notification
      send_token,               // Authorization token for this mailbox
      content_hint              // Optional: 'receipt' for silent push
    } = body

    // Validation
    if (!recipient_mailbox_token || typeof recipient_mailbox_token !== 'string' || recipient_mailbox_token.length !== 64) {
      return new Response(
        JSON.stringify({ error: 'recipient_mailbox_token invalide', error_code: 'INVALID_MAILBOX_TOKEN' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!sealed_envelope || typeof sealed_envelope !== 'string') {
      return new Response(
        JSON.stringify({ error: 'sealed_envelope requis', error_code: 'MISSING_ENVELOPE' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Validate envelope is valid base64 and reasonable size
    try {
      const decodedSize = atob(sealed_envelope).length
      if (decodedSize > 100 * 1024) { // 100KB max
        return new Response(
          JSON.stringify({ error: 'Message trop volumineux (max 100KB)', error_code: 'MESSAGE_TOO_LARGE' }),
          { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
      }
    } catch {
      return new Response(
        JSON.stringify({ error: 'sealed_envelope invalide (base64 attendu)', error_code: 'INVALID_ENVELOPE' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      { auth: { autoRefreshToken: false, persistSession: false } }
    )

    const clientIP = getClientIP(req)

    // Rate limiting by IP only (no user auth for sealed sender)
    const ipCheck = await checkRateLimit(
      supabaseAdmin, `ip:${clientIP}`, 'sealed_message', RATE_LIMIT_CONFIG
    )
    if (!ipCheck.allowed) {
      console.log('[SEND-SEALED-MESSAGE] rate limit IP')
      return new Response(
        JSON.stringify({ error: ipCheck.message, error_code: 'RATE_LIMITED' }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Verify the recipient mailbox exists and is active
    const { data: mailbox, error: mailboxError } = await supabaseAdmin
      .from('mailboxes')
      .select('id, sealed_sender_public_key')
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
    // Check if this mailbox has any active send tokens registered
    const { data: activeTokens } = await supabaseAdmin
      .from('mailbox_send_tokens')
      .select('id')
      .eq('mailbox_token', recipient_mailbox_token)
      .eq('is_active', true)
      .limit(1)

    // Send token is always required
    if (!send_token || typeof send_token !== 'string') {
      return new Response(
        JSON.stringify({ error: 'invalid_send_token', error_code: 'INVALID_SEND_TOKEN' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Hash the provided send_token for comparison
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

    // Calculate envelope hash for deduplication
    const envelopeHash = await crypto.subtle.digest(
      'SHA-256',
      new TextEncoder().encode(sealed_envelope)
    ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

    // Check for duplicate
    const { data: existingMessage } = await supabaseAdmin
      .from('sealed_messages')
      .select('id')
      .eq('envelope_hash', envelopeHash)
      .single()

    if (existingMessage) {
      // Message already exists - idempotent response
      return new Response(
        JSON.stringify({
          success: true,
          duplicate: true,
          message: 'Message déjà envoyé'
        }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Fetch message expiry from app_config (fallback: 24h)
    let expiryHours = 24
    try {
      const { data: configRow } = await supabaseAdmin
        .from('app_config')
        .select('message_expiry_hours')
        .single()
      if (configRow?.message_expiry_hours) {
        expiryHours = configRow.message_expiry_hours
      }
    } catch (_) { /* use default */ }

    // Store the sealed message
    const expiresAt = new Date(Date.now() + expiryHours * 60 * 60 * 1000).toISOString()

    const { data: newMessage, error: insertError } = await supabaseAdmin
      .from('sealed_messages')
      .insert({
        recipient_mailbox_token,
        sealed_envelope: sealed_envelope, // Store as text (base64)
        envelope_hash: envelopeHash,
        expires_at: expiresAt,
        is_delivered: false
      })
      .select('id, created_at')
      .single()

    if (insertError) {
      console.error('[SEND-SEALED-MESSAGE] Insert error:', insertError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de l\'envoi', error_code: 'INSERT_ERROR' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // If notification relay token provided, trigger push notification
    // This is also anonymous - we just ping the relay without knowing who it is
    if (notification_relay_token) {
      try {
        const { data: relay } = await supabaseAdmin
          .from('notification_relays')
          .select('fcm_token, platform, encrypted_push_token, encrypted_platform')
          .eq('relay_token', notification_relay_token)
          .eq('is_active', true)
          .single()

        if (relay && relay.fcm_token) {
          // Send FCM data-only notification with message ID for deduplication
          await sendFCMNotification(
            relay.fcm_token,
            relay.platform || 'android',
            newMessage.id,
            newMessage.created_at,
            content_hint as string | undefined
          )
          console.log('[SEND-SEALED-MESSAGE] notification envoyée')
        } else if (relay) {
          // Legacy encrypted mode - log for now
          console.log('[SEND-SEALED-MESSAGE] relay legacy, notification ignorée')
        }
      } catch (notifError) {
        // Silently fail notification - message is still delivered via mailbox
        console.error(`[SEND-SEALED-MESSAGE] Notification error:`, notifError)
      }
    }

    console.log('[SEND-SEALED-MESSAGE] message stocké')

    return new Response(
      JSON.stringify({
        success: true,
        message_id: newMessage.id,
        timestamp: newMessage.created_at,
        expires_at: expiresAt
      }),
      { status: 201, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[SEND-SEALED-MESSAGE] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne', error_code: 'INTERNAL_ERROR' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
