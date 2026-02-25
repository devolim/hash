import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Rate limiting pour les appels
const RATE_LIMIT_CONFIG = {
  maxAttempts: 30,     // 30 appels max
  windowMinutes: 60,   // Par heure
  blockMinutes: 60     // Bloqué 1h si dépassé
}

// Rate limit par paire (anti-harcèlement)
const RATE_LIMIT_PAIR = {
  maxAttempts: 20,     // 20 appels max vers la même personne
  windowMinutes: 15,   // Par 15 minutes
  blockMinutes: 30     // Bloqué 30min si dépassé
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

    // Validation
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

    // Validation stricte de la session (vérifie session_valid_after après transfert)
    const sessionCheck = await validateSessionStrict(supabaseAdmin, authHeader, supabaseUser)
    if (!sessionCheck.valid) {
      return new Response(
        JSON.stringify({ error: sessionCheck.error || 'Session invalide' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const callerId = sessionCheck.userId!
    const clientIP = getClientIP(req)

    // Empêcher de s'appeler soi-même
    if (callerId === callee_id) {
      return new Response(
        JSON.stringify({ error: 'Vous ne pouvez pas vous appeler vous-même' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Vérifier que l'appelant existe
    const { data: callerData, error: callerError } = await supabaseAdmin
      .from('users')
      .select('id, hash_id')
      .eq('id', callerId)
      .single()

    if (callerError || !callerData) {
      console.error('[START-CALL] appelant non trouvé')
      return new Response(
        JSON.stringify({ error: 'Appelant non trouvé' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Vérifier que le destinataire existe
    const { data: calleeData, error: calleeError } = await supabaseAdmin
      .from('users')
      .select('id, hash_id')
      .eq('id', callee_id)
      .single()

    if (calleeError || !calleeData) {
      console.error('[START-CALL] destinataire non trouvé')
      return new Response(
        JSON.stringify({ error: 'Destinataire non trouvé' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Rate limiting global
    const globalCheck = await checkRateLimit(
      supabaseAdmin, `user:${callerId}`, 'start_call', RATE_LIMIT_CONFIG
    )
    if (!globalCheck.allowed) {
      console.log('[START-CALL] rate limit global')
      return new Response(
        JSON.stringify({ error: globalCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Rate limiting par paire (anti-harcèlement)
    const pairCheck = await checkRateLimit(
      supabaseAdmin, `call:${callerId}:${callee_id}`, 'start_call_pair', RATE_LIMIT_PAIR
    )
    if (!pairCheck.allowed) {
      console.log('[START-CALL] rate limit paire')
      return new Response(
        JSON.stringify({ error: 'Trop d\'appels vers ce contact' }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Rate limiting IP
    const ipCheck = await checkRateLimit(
      supabaseAdmin, `ip:${clientIP}`, 'start_call',
      { maxAttempts: 60, windowMinutes: 60, blockMinutes: 60 }
    )
    if (!ipCheck.allowed) {
      console.log('[START-CALL] rate limit IP')
      return new Response(
        JSON.stringify({ error: ipCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log('[START-CALL] appel initié')

    return new Response(
      JSON.stringify({
        success: true,
        call_id: crypto.randomUUID(),
        callee_fcm_token: null, // FCM not implemented yet
        timestamp: new Date().toISOString()
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[START-CALL] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
