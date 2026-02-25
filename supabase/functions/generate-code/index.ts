// Edge Function: generate-code
// Generates a temporary 6-digit code for contact exchange

import { serve } from 'https://deno.land/std@0.177.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'
import { validateSessionStrict } from "../_shared/session-validator.ts"

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

    // Validation stricte de la session (vérifie session_valid_after après transfert)
    const sessionCheck = await validateSessionStrict(supabaseAdmin, authHeader!, supabaseClient)
    if (!sessionCheck.valid) {
      return new Response(
        JSON.stringify({ error: sessionCheck.error || 'SESSION_INVALIDATED' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }
    const user = { id: sessionCheck.userId! }

    // Delete existing codes for this user (replace with new one)
    await supabaseAdmin
      .from('temporary_codes')
      .delete()
      .eq('user_id', user.id)

    // Generate 6-digit code
    const code = Array.from(
      { length: 6 },
      () => Math.floor(Math.random() * 10).toString()
    ).join('')

    // Store code with 5 minute expiration
    const expiresAt = new Date(Date.now() + 5 * 60 * 1000).toISOString()

    const { error: insertError } = await supabaseAdmin
      .from('temporary_codes')
      .insert({
        user_id: user.id,
        code,
        expires_at: expiresAt
      })

    if (insertError) {
      console.error('Code insert error:', insertError)
      return new Response(
        JSON.stringify({ error: 'CODE_GENERATION_FAILED' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    return new Response(
      JSON.stringify({
        code,
        expires_at: expiresAt
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
