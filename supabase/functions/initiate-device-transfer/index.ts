// Edge Function: initiate-device-transfer
// Called by OLD device after PIN validation
// Stores the encrypted transfer package for the new device to retrieve

import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Rate limiting
const RATE_LIMIT_CONFIG = {
  maxAttempts: 3,
  windowMinutes: 30,
  blockMinutes: 60
}

// Code de transfert valide 5 minutes
const TRANSFER_CODE_VALIDITY_MINUTES = 5

interface InitiateTransferRequest {
  transfer_code: string       // Code de transfert (TRF-XXXX-XXXX-XXXX)
  encrypted_package: string   // Package chiffré avec le code de transfert
  proximity_code: string      // Code emoji pour vérification de proximité
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

    const userId = sessionCheck.userId!
    const clientIP = getClientIP(req)

    // Rate limiting
    const rateLimitCheck = await checkRateLimit(
      supabaseAdmin,
      `user:${userId}`,
      'initiate_transfer',
      RATE_LIMIT_CONFIG
    )

    if (!rateLimitCheck.allowed) {
      console.log('[INITIATE-TRANSFER] rate limit utilisateur')
      return new Response(
        JSON.stringify({ error: rateLimitCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Parser la requête
    const data: InitiateTransferRequest = await req.json()

    // Valider le code de transfert (format: TRF-XXXX-XXXX-XXXX)
    if (!data.transfer_code || !/^TRF-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}$/.test(data.transfer_code)) {
      return new Response(
        JSON.stringify({ error: 'Code de transfert invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Valider le package chiffré (base64)
    if (!data.encrypted_package || data.encrypted_package.length < 100) {
      return new Response(
        JSON.stringify({ error: 'Package chiffré invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Valider le code de proximité (emojis)
    if (!data.proximity_code || data.proximity_code.length < 4) {
      return new Response(
        JSON.stringify({ error: 'Code de proximité invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Récupérer les infos utilisateur
    const { data: userData, error: userError } = await supabaseAdmin
      .from('users')
      .select('id, hash_id')
      .eq('id', userId)
      .single()

    if (userError || !userData) {
      return new Response(
        JSON.stringify({ error: 'Utilisateur non trouvé' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Vérifier qu'un transfert est en cours pour cet utilisateur
    const { data: transfer, error: transferError } = await supabaseAdmin
      .from('device_transfers')
      .select('*')
      .eq('old_user_id', userId)
      .in('status', ['pending_temp_code', 'temp_code_validated'])
      .single()

    if (transferError || !transfer) {
      return new Response(
        JSON.stringify({ error: 'Aucun transfert en cours' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Hasher le code de transfert pour stockage
    const transferCodeHash = await crypto.subtle.digest(
      'SHA-256',
      new TextEncoder().encode(data.transfer_code + userData.hash_id)
    ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

    // Calculer l'expiration du code de transfert
    const expiresAt = new Date(Date.now() + TRANSFER_CODE_VALIDITY_MINUTES * 60 * 1000)

    // Mettre à jour le transfert avec le package
    const { error: updateError } = await supabaseAdmin
      .from('device_transfers')
      .update({
        transfer_code_hash: transferCodeHash,
        transfer_code_expires_at: expiresAt.toISOString(),
        encrypted_package: data.encrypted_package,
        proximity_code: data.proximity_code,
        status: 'waiting_for_new_device',
        updated_at: new Date().toISOString()
      })
      .eq('id', transfer.id)

    if (updateError) {
      console.error('[INITIATE-TRANSFER] Update error:', updateError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de la mise à jour' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log('[INITIATE-TRANSFER] transfert initié')

    return new Response(
      JSON.stringify({
        success: true,
        transfer_id: transfer.id,
        expires_at: expiresAt.toISOString(),
        validity_minutes: TRANSFER_CODE_VALIDITY_MINUTES
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[INITIATE-TRANSFER] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
