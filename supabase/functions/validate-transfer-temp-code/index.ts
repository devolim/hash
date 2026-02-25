// Edge Function: validate-transfer-temp-code
// Called by NEW device to validate Hash ID + temp code combination
// This is the first step on the new device to initiate a transfer

import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Rate limiting strict: empêcher le bruteforce du code temporaire
const RATE_LIMIT_CONFIG = {
  maxAttempts: 5,      // 5 tentatives
  windowMinutes: 15,   // Par 15 minutes
  blockMinutes: 60     // Bloqué 1h si dépassé
}

interface ValidateTempCodeRequest {
  hash_id: string    // Hash ID de l'utilisateur à récupérer
  temp_code: string  // Code temporaire (6 chiffres)
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

    // Rate limiting par IP (pas d'auth requise pour cette étape)
    const rateLimitCheck = await checkRateLimit(
      supabaseAdmin,
      `ip:${clientIP}`,
      'validate_transfer_temp',
      RATE_LIMIT_CONFIG
    )

    if (!rateLimitCheck.allowed) {
      console.log('[VALIDATE-TRANSFER-TEMP] rate limit IP')
      return new Response(
        JSON.stringify({ error: rateLimitCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Parser la requête
    const data: ValidateTempCodeRequest = await req.json()

    // Valider les entrées
    if (!data.hash_id || !data.hash_id.startsWith('#')) {
      return new Response(
        JSON.stringify({ error: 'Hash ID invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!data.temp_code || !/^\d{6}$/.test(data.temp_code)) {
      return new Response(
        JSON.stringify({ error: 'Code temporaire invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Hasher le code pour comparaison
    const tempCodeHash = await crypto.subtle.digest(
      'SHA-256',
      new TextEncoder().encode(data.temp_code + data.hash_id)
    ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

    // Chercher le transfert en attente
    const { data: transfer, error: transferError } = await supabaseAdmin
      .from('device_transfers')
      .select('*')
      .eq('hash_id', data.hash_id)
      .eq('temp_code_hash', tempCodeHash)
      .eq('status', 'pending_temp_code')
      .single()

    if (transferError || !transfer) {
      console.log('[VALIDATE-TRANSFER-TEMP] code invalide')
      // Ne pas révéler si le hash_id existe ou non
      return new Response(
        JSON.stringify({ valid: false, error: 'Code invalide ou expiré' }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Vérifier l'expiration
    if (new Date(transfer.temp_code_expires_at) < new Date()) {
      console.log('[VALIDATE-TRANSFER-TEMP] code expiré')

      // Supprimer le transfert expiré
      await supabaseAdmin
        .from('device_transfers')
        .delete()
        .eq('id', transfer.id)

      return new Response(
        JSON.stringify({ valid: false, error: 'Code expiré' }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Mettre à jour le statut - en attente du code de transfert
    await supabaseAdmin
      .from('device_transfers')
      .update({
        status: 'temp_code_validated',
        new_device_ip: clientIP,
        updated_at: new Date().toISOString()
      })
      .eq('id', transfer.id)

    console.log('[VALIDATE-TRANSFER-TEMP] code valide')

    return new Response(
      JSON.stringify({
        valid: true,
        transfer_id: transfer.id,
        message: 'Code validé. En attente du code de transfert.'
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[VALIDATE-TRANSFER-TEMP] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
