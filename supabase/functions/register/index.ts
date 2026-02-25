// Edge Function: register
// Handles anonymous user registration with maximum security

import { serve } from 'https://deno.land/std@0.177.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

interface RegisterRequest {
  device_id: string
  identity_public_key: string
  signed_prekey_public: string
  signed_prekey_signature: string
  signed_prekey_id: number
  prekeys: Array<{ prekey_id: number; public_key: string }>
}

// Validate base64 encoded key
function isValidBase64Key(key: string, minLength = 32): boolean {
  try {
    const decoded = atob(key)
    return decoded.length >= minLength
  } catch {
    return false
  }
}

// Validate request payload
function validateRequest(data: RegisterRequest): string | null {
  if (!data.device_id || data.device_id.length < 16) {
    return 'Invalid device_id'
  }
  if (!isValidBase64Key(data.identity_public_key)) {
    return 'Invalid identity_public_key'
  }
  if (!isValidBase64Key(data.signed_prekey_public)) {
    return 'Invalid signed_prekey_public'
  }
  if (!isValidBase64Key(data.signed_prekey_signature, 64)) {
    return 'Invalid signed_prekey_signature'
  }
  if (typeof data.signed_prekey_id !== 'number' || data.signed_prekey_id < 0) {
    return 'Invalid signed_prekey_id'
  }
  if (!Array.isArray(data.prekeys) || data.prekeys.length < 10) {
    return 'Must provide at least 10 prekeys'
  }
  for (const pk of data.prekeys) {
    if (typeof pk.prekey_id !== 'number' || !isValidBase64Key(pk.public_key)) {
      return 'Invalid prekey format'
    }
  }
  return null
}

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      { auth: { autoRefreshToken: false, persistSession: false } }
    )

    // Get client IP for rate limiting
    const clientIp = req.headers.get('x-forwarded-for')?.split(',')[0] ||
                     req.headers.get('x-real-ip') ||
                     'unknown'

    // Check rate limit
    const ipHash = await crypto.subtle.digest(
      'SHA-256',
      new TextEncoder().encode(clientIp)
    ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

    const { data: rateLimit } = await supabaseAdmin
      .from('rate_limits')
      .select('*')
      .eq('identifier', ipHash)
      .eq('action_type', 'register')
      .single()

    if (rateLimit?.blocked_until && new Date(rateLimit.blocked_until) > new Date()) {
      return new Response(
        JSON.stringify({ error: 'RATE_LIMITED', blocked_until: rateLimit.blocked_until }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Parse and validate request
    const data: RegisterRequest = await req.json()
    const validationError = validateRequest(data)
    if (validationError) {
      return new Response(
        JSON.stringify({ error: 'VALIDATION_ERROR', message: validationError }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Create anonymous auth user
    const { data: authData, error: authError } = await supabaseAdmin.auth.admin.createUser({
      email: `${crypto.randomUUID()}@hash.anonymous`,
      email_confirm: true,
      user_metadata: { anonymous: true }
    })

    if (authError) {
      console.error('Auth error:', authError)
      return new Response(
        JSON.stringify({ error: 'AUTH_ERROR' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Hash device ID
    const deviceHash = await crypto.subtle.digest(
      'SHA-256',
      new TextEncoder().encode(data.device_id)
    ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

    // Check if device already registered
    const { data: existingUser } = await supabaseAdmin
      .from('users')
      .select('id')
      .eq('device_id', deviceHash)
      .single()

    if (existingUser) {
      // Delete the auth user we just created
      await supabaseAdmin.auth.admin.deleteUser(authData.user!.id)
      return new Response(
        JSON.stringify({ error: 'DEVICE_ALREADY_REGISTERED' }),
        { status: 409, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Generate Hash ID
    const { data: hashIdResult } = await supabaseAdmin.rpc('generate_hash_id')
    const hashId = hashIdResult as string

    // Create user record
    const { error: userError } = await supabaseAdmin
      .from('users')
      .insert({
        id: authData.user!.id,
        hash_id: hashId,
        device_id: deviceHash,
        identity_public_key: data.identity_public_key,
        signed_prekey_public: data.signed_prekey_public,
        signed_prekey_signature: data.signed_prekey_signature,
        signed_prekey_id: data.signed_prekey_id
      })

    if (userError) {
      console.error('User creation error:', userError)
      await supabaseAdmin.auth.admin.deleteUser(authData.user!.id)
      return new Response(
        JSON.stringify({ error: 'USER_CREATION_ERROR' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Store prekeys
    const prekeysToInsert = data.prekeys.map(pk => ({
      user_id: authData.user!.id,
      prekey_id: pk.prekey_id,
      public_key: pk.public_key
    }))

    await supabaseAdmin.from('prekeys').insert(prekeysToInsert)

    // Generate session token for the user
    const { data: sessionData, error: sessionError } = await supabaseAdmin.auth.admin.generateLink({
      type: 'magiclink',
      email: `${authData.user!.id}@hash.anonymous`
    })

    // Create a session directly
    const { data: session } = await supabaseAdmin.auth.admin.createSession({
      user_id: authData.user!.id
    })

    return new Response(
      JSON.stringify({
        user_id: authData.user!.id,
        hash_id: hashId,
        access_token: session.session?.access_token,
        refresh_token: session.session?.refresh_token
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'INTERNAL_ERROR' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
