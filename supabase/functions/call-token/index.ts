import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

const LIVEKIT_API_URL = Deno.env.get('LIVEKIT_API_BASE_URL') + '/api/token'
const LIVEKIT_API_KEY = Deno.env.get('LIVEKIT_API_KEY') ?? ''

// Rate limiting pour les tokens d'appel
const RATE_LIMIT_CONFIG = {
  maxAttempts: 30,     // 30 tokens max
  windowMinutes: 60,   // Par heure
  blockMinutes: 60     // Bloqué 1h si dépassé
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
    const { callee_id, call_type } = body

    // Validation des paramètres
    if (!callee_id || typeof callee_id !== 'string') {
      return new Response(
        JSON.stringify({ error: 'callee_id invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!call_type || !['audio', 'video'].includes(call_type)) {
      return new Response(
        JSON.stringify({ error: 'call_type invalide (audio ou video)' }),
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

    // Validation stricte de la session
    const sessionCheck = await validateSessionStrict(supabaseAdmin, authHeader, supabaseUser)
    if (!sessionCheck.valid) {
      return new Response(
        JSON.stringify({ error: sessionCheck.error || 'Session invalide' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const userId = sessionCheck.userId!
    const clientIP = getClientIP(req)

    // Empêcher de s'appeler soi-même
    if (userId === callee_id) {
      return new Response(
        JSON.stringify({ error: 'Vous ne pouvez pas vous appeler vous-même' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Rate limiting
    const rateLimitCheck = await checkRateLimit(
      supabaseAdmin, `call-token:${userId}`, 'call_token', RATE_LIMIT_CONFIG
    )
    if (!rateLimitCheck.allowed) {
      console.log('[CALL-TOKEN] rate limit utilisateur')
      return new Response(
        JSON.stringify({ error: rateLimitCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Appeler l'API LiveKit
    const livekitResponse = await fetch(LIVEKIT_API_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-API-Key': LIVEKIT_API_KEY,
      },
      body: JSON.stringify({
        user_id: userId,
        callee_id: callee_id,
        call_type: call_type,
      }),
    })

    if (!livekitResponse.ok) {
      const errorData = await livekitResponse.json().catch(() => ({}))
      console.error('[CALL-TOKEN] erreur LiveKit:', errorData)
      return new Response(
        JSON.stringify({ error: errorData.message || 'Erreur lors de la génération du token' }),
        { status: livekitResponse.status, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const tokenData = await livekitResponse.json()

    // Add token TTL for dynamic client-side caching (default 300s = 5min)
    const tokenTtlSeconds = tokenData.token_ttl_seconds ?? 300
    tokenData.token_ttl_seconds = tokenTtlSeconds

    console.log('[CALL-TOKEN] token généré')

    return new Response(
      JSON.stringify(tokenData),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[CALL-TOKEN] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
