import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Rate limiting pour l'inscription (ajusté pour être raisonnable)
const RATE_LIMIT_IP = {
  maxAttempts: 20,     // 20 inscriptions max par IP
  windowMinutes: 60,   // Par heure
  blockMinutes: 60     // Bloqué 1h si dépassé
}

const RATE_LIMIT_DEVICE = {
  maxAttempts: 10,     // 10 inscriptions max par appareil
  windowMinutes: 60,   // Par heure
  blockMinutes: 120    // Bloqué 2h si dépassé
}

// Générer un hash_id unique (000-000-XXX)
// Format: 3 chiffres - 3 chiffres - 3 lettres
function generateHashId(): string {
  const digits = '0123456789'
  const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

  // Première partie: 3 chiffres
  let part1 = ''
  for (let i = 0; i < 3; i++) {
    part1 += digits.charAt(Math.floor(Math.random() * digits.length))
  }

  // Deuxième partie: 3 chiffres
  let part2 = ''
  for (let i = 0; i < 3; i++) {
    part2 += digits.charAt(Math.floor(Math.random() * digits.length))
  }

  // Troisième partie: 3 lettres
  let part3 = ''
  for (let i = 0; i < 3; i++) {
    part3 += letters.charAt(Math.floor(Math.random() * letters.length))
  }

  return `${part1}-${part2}-${part3}`
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
    const {
      device_id,
      identity_public_key,
      signed_prekey_public,
      signed_prekey_signature,
      signed_prekey_id,
      prekeys,
      // Zero-Knowledge tokens (optional - will be generated client-side)
      mailbox_token,
      relay_token,
      sealed_sender_public_key
    } = body

    // Validation stricte des entrées
    if (!device_id || typeof device_id !== 'string' || device_id.length < 10) {
      return new Response(
        JSON.stringify({ error: 'device_id invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!identity_public_key || typeof identity_public_key !== 'string') {
      return new Response(
        JSON.stringify({ error: 'identity_public_key invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!signed_prekey_public || typeof signed_prekey_public !== 'string') {
      return new Response(
        JSON.stringify({ error: 'signed_prekey_public invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!signed_prekey_signature || typeof signed_prekey_signature !== 'string') {
      return new Response(
        JSON.stringify({ error: 'signed_prekey_signature invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (typeof signed_prekey_id !== 'number') {
      return new Response(
        JSON.stringify({ error: 'signed_prekey_id invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!Array.isArray(prekeys) || prekeys.length === 0) {
      return new Response(
        JSON.stringify({ error: 'prekeys invalides' }),
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

    // Vérifier l'authentification anonyme
    const { data: { user }, error: authError } = await supabaseUser.auth.getUser()
    if (authError || !user) {
      return new Response(
        JSON.stringify({ error: 'Token invalide ou expiré' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const userId = user.id
    const clientIP = getClientIP(req)

    // Hash device_id (privacy: ne jamais stocker l'empreinte brute de l'appareil)
    const deviceHash = await crypto.subtle.digest(
      'SHA-256',
      new TextEncoder().encode(device_id)
    ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

    // Vérifier si cet utilisateur auth a déjà un compte
    const { data: existingUser } = await supabaseAdmin
      .from('users')
      .select('id')
      .eq('id', userId)
      .single()

    if (existingUser) {
      return new Response(
        JSON.stringify({ error: 'Un compte existe déjà pour cet utilisateur' }),
        { status: 409, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Vérifier si ce device_id est déjà utilisé
    const { data: existingDevice } = await supabaseAdmin
      .from('users')
      .select('id')
      .eq('device_id', deviceHash)
      .single()

    if (existingDevice) {
      // Réinstallation détectée : nettoyer l'ancien compte et continuer
      const oldUserId = existingDevice.id

      // 1. Send tokens et sealed messages liés aux mailboxes de l'ancien utilisateur
      const { data: oldMailboxes } = await supabaseAdmin
        .from('mailboxes')
        .select('mailbox_token')
        .eq('user_id', oldUserId)
      if (oldMailboxes) {
        for (const mb of oldMailboxes) {
          await supabaseAdmin.from('sealed_messages').delete().eq('recipient_mailbox_token', mb.mailbox_token)
          await supabaseAdmin.from('mailbox_send_tokens').delete().eq('mailbox_token', mb.mailbox_token)
        }
      }

      // 2. Mailboxes
      await supabaseAdmin.from('mailboxes').delete().eq('user_id', oldUserId)

      // 2b. Pending messages
      await supabaseAdmin.from('pending_messages').delete().eq('recipient_id', oldUserId)
      await supabaseAdmin.from('pending_messages').delete().eq('sender_id', oldUserId)

      // 2c. Media files et quota (anonymisé)
      const oldEncoder = new TextEncoder()
      const oldKeyData = oldEncoder.encode(Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '')
      const oldHmacKey = await crypto.subtle.importKey(
        'raw', oldKeyData, { name: 'HMAC', hash: 'SHA-256' }, false, ['sign']
      )
      const oldSignature = await crypto.subtle.sign('HMAC', oldHmacKey, oldEncoder.encode(oldUserId))
      const oldAnonId = Array.from(new Uint8Array(oldSignature))
        .map(b => b.toString(16).padStart(2, '0'))
        .join('')

      const { data: oldMediaFiles } = await supabaseAdmin
        .from('media_files')
        .select('storage_path')
        .eq('uploader_id', oldAnonId)
      if (oldMediaFiles && oldMediaFiles.length > 0) {
        await supabaseAdmin.storage.from('media').remove(oldMediaFiles.map(f => f.storage_path))
      }
      await supabaseAdmin.from('media_files').delete().eq('uploader_id', oldAnonId)
      await supabaseAdmin.from('user_media_quota').delete().eq('uploader_id', oldAnonId)

      // 3. Prekeys
      await supabaseAdmin.from('prekeys').delete().eq('user_id', oldUserId)

      // 4. Temporary codes
      await supabaseAdmin.from('temporary_codes').delete().eq('user_id', oldUserId)

      // 5. Rate limits
      await supabaseAdmin.from('rate_limits').delete().eq('identifier', `user:${oldUserId}`)

      // 6. Contact requests (les deux directions)
      await supabaseAdmin.from('contact_requests').delete().eq('requester_id', oldUserId)
      await supabaseAdmin.from('contact_requests').delete().eq('recipient_id', oldUserId)

      // 7. Notification relays
      const { data: oldUserData } = await supabaseAdmin
        .from('users')
        .select('relay_token')
        .eq('id', oldUserId)
        .single()
      if (oldUserData?.relay_token) {
        await supabaseAdmin.from('notification_relays').delete().eq('relay_token', oldUserData.relay_token)
      }

      // 8. Users table
      await supabaseAdmin.from('users').delete().eq('id', oldUserId)

      // 9. Ancien auth user
      try {
        await supabaseAdmin.auth.admin.deleteUser(oldUserId)
      } catch (_) {
        // Best-effort : l'ancien auth user peut déjà être supprimé
      }

      console.log('[REGISTER] ancien compte nettoyé pour réinstallation')
    }

    // Rate limiting par IP
    const ipCheck = await checkRateLimit(
      supabaseAdmin, `ip:${clientIP}`, 'register', RATE_LIMIT_IP
    )
    if (!ipCheck.allowed) {
      console.log('[REGISTER] rate limit IP')
      return new Response(
        JSON.stringify({ error: ipCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Rate limiting par device_id
    const deviceCheck = await checkRateLimit(
      supabaseAdmin, `device:${device_id}`, 'register', RATE_LIMIT_DEVICE
    )
    if (!deviceCheck.allowed) {
      console.log('[REGISTER] rate limit device')
      return new Response(
        JSON.stringify({ error: deviceCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Générer un hash_id unique
    let hashId = generateHashId()
    let attempts = 0
    const maxAttempts = 10

    while (attempts < maxAttempts) {
      const { data: existing } = await supabaseAdmin
        .from('users')
        .select('id')
        .eq('hash_id', hashId)
        .single()

      if (!existing) break
      hashId = generateHashId()
      attempts++
    }

    if (attempts >= maxAttempts) {
      console.error('[REGISTER] Could not generate unique hash_id')
      return new Response(
        JSON.stringify({ error: 'Erreur lors de la création du compte' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Créer l'utilisateur
    const { error: insertUserError } = await supabaseAdmin
      .from('users')
      .insert({
        id: userId,
        hash_id: hashId,
        device_id: deviceHash,
        identity_public_key: identity_public_key,
        signed_prekey_public: signed_prekey_public,
        signed_prekey_signature: signed_prekey_signature,
        signed_prekey_id: signed_prekey_id,
        // Zero-Knowledge tokens for sealed sender messaging
        mailbox_token: mailbox_token || null,
        relay_token: relay_token || null,
        sealed_sender_public_key: sealed_sender_public_key || null,
        mailbox_rotation_counter: 0
      })

    if (insertUserError) {
      console.error('[REGISTER] erreur insertion utilisateur:', insertUserError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de la création du compte' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Create mailbox entry if tokens are provided
    if (mailbox_token && sealed_sender_public_key) {
      const { error: mailboxError } = await supabaseAdmin
        .from('mailboxes')
        .insert({
          mailbox_token: mailbox_token,
          sealed_sender_public_key: sealed_sender_public_key,
          rotation_counter: 0,
          is_active: true
        })

      if (mailboxError) {
        console.error('[REGISTER] erreur insertion mailbox:', mailboxError)
        // Non-blocking error - user can still function without mailbox initially
      }
    }

    // Insérer les prekeys
    const prekeysToInsert = prekeys.map((pk: { prekey_id: number; public_key: string }) => ({
      user_id: userId,
      prekey_id: pk.prekey_id,
      public_key: pk.public_key
    }))

    const { error: insertPrekeysError } = await supabaseAdmin
      .from('prekeys')
      .insert(prekeysToInsert)

    if (insertPrekeysError) {
      console.error('[REGISTER] erreur insertion prekeys:', insertPrekeysError)
      // Rollback: supprimer l'utilisateur
      await supabaseAdmin.from('users').delete().eq('id', userId)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de la création du compte' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log('[REGISTER] nouvel utilisateur enregistré')

    return new Response(
      JSON.stringify({
        success: true,
        user_id: userId,
        hash_id: hashId,
        timestamp: new Date().toISOString()
      }),
      { status: 201, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[REGISTER] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
