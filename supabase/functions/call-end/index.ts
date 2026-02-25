import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

const LIVEKIT_API_URL = Deno.env.get('LIVEKIT_API_BASE_URL') + '/api/call/end'
const LIVEKIT_API_KEY = Deno.env.get('LIVEKIT_API_KEY') ?? ''

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
    const { room_id, status, quality_score } = body

    // Validation
    if (!room_id || typeof room_id !== 'string') {
      return new Response(
        JSON.stringify({ error: 'room_id invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const validStatuses = ['completed', 'missed', 'declined', 'failed']
    if (status && !validStatuses.includes(status)) {
      return new Response(
        JSON.stringify({ error: 'status invalide (completed, missed, declined, failed)' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (quality_score !== undefined && (typeof quality_score !== 'number' || quality_score < 0 || quality_score > 100)) {
      return new Response(
        JSON.stringify({ error: 'quality_score invalide (0-100)' }),
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

    // Validation de la session
    const sessionCheck = await validateSessionStrict(supabaseAdmin, authHeader, supabaseUser)
    if (!sessionCheck.valid) {
      return new Response(
        JSON.stringify({ error: sessionCheck.error || 'Session invalide' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
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
        room_id,
        status: status || 'completed',
        quality_score,
      }),
    })

    if (!livekitResponse.ok) {
      const errorData = await livekitResponse.json().catch(() => ({}))
      return new Response(
        JSON.stringify({ error: errorData.message || 'Erreur fin d\'appel' }),
        { status: livekitResponse.status, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const endData = await livekitResponse.json()

    console.log('[CALL-END] appel terminé')

    return new Response(
      JSON.stringify(endData),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[CALL-END] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
