import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

const LIVEKIT_API_URL = Deno.env.get('LIVEKIT_API_BASE_URL') + '/api/call/p2p-failed'
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
    const { room_id, lang } = body

    // Validation
    if (!room_id || typeof room_id !== 'string') {
      return new Response(
        JSON.stringify({ error: 'room_id invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const validLangs = ['fr', 'en']
    const language = validLangs.includes(lang) ? lang : 'fr'

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
        lang: language,
      }),
    })

    if (!livekitResponse.ok) {
      const errorData = await livekitResponse.json().catch(() => ({}))
      return new Response(
        JSON.stringify({ error: errorData.message || 'Erreur P2P failed' }),
        { status: livekitResponse.status, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const p2pData = await livekitResponse.json()

    console.log('[CALL-P2P-FAILED] échec P2P signalé')

    return new Response(
      JSON.stringify(p2pData),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[CALL-P2P-FAILED] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
