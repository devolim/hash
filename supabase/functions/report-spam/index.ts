import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP, cleanupOldRateLimits } from "../_shared/rate-limiter.ts"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

const RATE_LIMIT_CONFIG = {
  maxAttempts: 5,
  windowMinutes: 1440,  // 24 hours
  blockMinutes: 1440
}

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    let reported_hash_id: string, reason: string | undefined
    try {
      const body = await req.json()
      reported_hash_id = body.reported_hash_id
      reason = body.reason
    } catch {
      return new Response(
        JSON.stringify({ error: 'Invalid JSON body' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Validate input
    if (!reported_hash_id || typeof reported_hash_id !== 'string') {
      return new Response(
        JSON.stringify({ error: 'reported_hash_id is required' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Validate Hash ID format (XXX-XXX-XXX)
    const hashIdRegex = /^[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{3}$/
    if (!hashIdRegex.test(reported_hash_id)) {
      return new Response(
        JSON.stringify({ error: 'Invalid Hash ID format' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Validate reason if provided
    if (reason && (typeof reason !== 'string' || reason.length > 500)) {
      return new Response(
        JSON.stringify({ error: 'Reason must be a string of max 500 characters' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Create Supabase clients
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    )
    const supabaseUser = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      { global: { headers: { Authorization: req.headers.get('Authorization')! } } }
    )

    // Validate session (for rate limiting only - ID is NOT stored)
    const authHeader = req.headers.get('Authorization')!
    const session = await validateSessionStrict(supabaseAdmin, authHeader, supabaseUser)
    if (!session.valid || !session.userId) {
      return new Response(
        JSON.stringify({ error: session.error || 'Invalid session' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Rate limit by user ID (5 reports per 24h)
    const rateLimitResult = await checkRateLimit(
      supabaseAdmin,
      session.userId,
      'report_spam',
      RATE_LIMIT_CONFIG
    )

    if (!rateLimitResult.allowed) {
      return new Response(
        JSON.stringify({ error: rateLimitResult.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Insert spam report with reporter_id = NULL (anonymous)
    const { error: insertError } = await supabaseAdmin
      .from('spam_reports')
      .insert({
        reported_hash_id: reported_hash_id,
        reporter_id: null,
        reason: reason || null,
        created_at: new Date().toISOString(),
      })

    if (insertError) {
      console.error('[REPORT-SPAM] Insert error:', insertError)
      return new Response(
        JSON.stringify({ error: 'Failed to submit report' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Random cleanup (1% chance)
    if (Math.random() < 0.01) {
      await cleanupOldRateLimits(supabaseAdmin)
      // Also cleanup old spam reports (> 90 days)
      const ninetyDaysAgo = new Date(Date.now() - 90 * 24 * 60 * 60 * 1000).toISOString()
      await supabaseAdmin
        .from('spam_reports')
        .delete()
        .lt('created_at', ninetyDaysAgo)
    }

    console.log(`[REPORT-SPAM] Report submitted for ${reported_hash_id}`)

    return new Response(
      JSON.stringify({ success: true }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (err) {
    console.error('[REPORT-SPAM] Error:', err)
    return new Response(
      JSON.stringify({ error: 'Internal server error' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
