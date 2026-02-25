// Edge Function: get-transfer-status
// Called by NEW device to poll the transfer status
// No auth required (new device doesn't have a session yet)

import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Rate limiting (polling: 10 req/min)
const RATE_LIMIT_CONFIG = {
  maxAttempts: 10,
  windowMinutes: 1,
  blockMinutes: 5
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

    const clientIP = getClientIP(req)

    // Rate limiting par IP
    const rateLimitCheck = await checkRateLimit(
      supabaseAdmin,
      `ip:${clientIP}`,
      'get_transfer_status',
      RATE_LIMIT_CONFIG
    )

    if (!rateLimitCheck.allowed) {
      return new Response(
        JSON.stringify({ error: rateLimitCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Parser la requête
    const { transfer_id } = await req.json()

    if (!transfer_id) {
      return new Response(
        JSON.stringify({ error: 'transfer_id requis' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Récupérer le statut du transfert
    const { data: transfer, error: transferError } = await supabaseAdmin
      .from('device_transfers')
      .select('status, updated_at')
      .eq('id', transfer_id)
      .single()

    if (transferError || !transfer) {
      return new Response(
        JSON.stringify({ error: 'Transfert non trouvé' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    return new Response(
      JSON.stringify({
        status: transfer.status,
        updated_at: transfer.updated_at
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[GET-TRANSFER-STATUS] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
