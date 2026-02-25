// Edge Function: login
// Handles device-based login for returning users

import { serve } from 'https://deno.land/std@0.177.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

interface LoginRequest {
  device_id: string
}

serve(async (req) => {
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

    const ipHash = await crypto.subtle.digest(
      'SHA-256',
      new TextEncoder().encode(clientIp)
    ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

    // Check rate limit BEFORE any lookup (prevents enumeration)
    const { data: rateLimit } = await supabaseAdmin
      .from('rate_limits')
      .select('*')
      .eq('identifier', ipHash)
      .eq('action_type', 'login')
      .single()

    if (rateLimit?.blocked_until && new Date(rateLimit.blocked_until) > new Date()) {
      // Return same generic error as device-not-found to prevent enumeration
      return new Response(
        JSON.stringify({ error: 'LOGIN_FAILED' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Parse request
    const data: LoginRequest = await req.json()

    if (!data.device_id || data.device_id.length < 16) {
      // Generic error to prevent enumeration
      return new Response(
        JSON.stringify({ error: 'LOGIN_FAILED' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Hash device ID
    const deviceHash = await crypto.subtle.digest(
      'SHA-256',
      new TextEncoder().encode(data.device_id)
    ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

    // Find user by device
    const { data: user } = await supabaseAdmin
      .from('users')
      .select('id, hash_id')
      .eq('device_id', deviceHash)
      .single()

    if (!user) {
      // Increment rate limit
      const attempts = (rateLimit?.attempts || 0) + 1
      let blockedUntil = null

      if (attempts >= 10) {
        blockedUntil = new Date(Date.now() + 60 * 60 * 1000).toISOString()
      } else if (attempts >= 5) {
        blockedUntil = new Date(Date.now() + 15 * 60 * 1000).toISOString()
      }

      await supabaseAdmin
        .from('rate_limits')
        .upsert({
          identifier: ipHash,
          action_type: 'login',
          attempts,
          blocked_until: blockedUntil,
          first_attempt_at: rateLimit?.first_attempt_at || new Date().toISOString()
        })

      // Same generic error for all failures (prevents device enumeration)
      return new Response(
        JSON.stringify({ error: 'LOGIN_FAILED' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Reset rate limit on success
    await supabaseAdmin
      .from('rate_limits')
      .delete()
      .eq('identifier', ipHash)
      .eq('action_type', 'login')

    // Create session for the user
    const { data: session, error: sessionError } = await supabaseAdmin.auth.admin.createSession({
      user_id: user.id
    })

    if (sessionError) {
      console.error('Session error:', sessionError)
      return new Response(
        JSON.stringify({ error: 'SESSION_ERROR' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    return new Response(
      JSON.stringify({
        user_id: user.id,
        hash_id: user.hash_id,
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
