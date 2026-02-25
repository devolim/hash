// Edge Function: register-transfer-temp-code
// Called by OLD device to register a temporary code for transfer initiation
// The new device will use this code (with Hash ID) to start the transfer process

import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Rate limiting: 5 tentatives par heure (action sensible)
const RATE_LIMIT_CONFIG = {
  maxAttempts: 5,
  windowMinutes: 60,
  blockMinutes: 120
}

// Code temporaire valide 5 minutes
const TEMP_CODE_VALIDITY_MINUTES = 5

interface RegisterTempCodeRequest {
  temp_code: string  // Code généré côté client (6 chiffres)
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
      'register_transfer_temp',
      RATE_LIMIT_CONFIG
    )

    if (!rateLimitCheck.allowed) {
      console.log('[REGISTER-TRANSFER-TEMP] rate limit utilisateur')
      return new Response(
        JSON.stringify({ error: rateLimitCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Parser la requête
    const data: RegisterTempCodeRequest = await req.json()

    // Valider le code temporaire (6 chiffres)
    if (!data.temp_code || !/^\d{6}$/.test(data.temp_code)) {
      return new Response(
        JSON.stringify({ error: 'Code temporaire invalide (6 chiffres requis)' }),
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

    // Supprimer tout ancien code de transfert pour cet utilisateur
    await supabaseAdmin
      .from('device_transfers')
      .delete()
      .eq('old_user_id', userId)

    // Calculer l'expiration
    const expiresAt = new Date(Date.now() + TEMP_CODE_VALIDITY_MINUTES * 60 * 1000)

    // Hasher le code temporaire pour stockage
    const tempCodeHash = await crypto.subtle.digest(
      'SHA-256',
      new TextEncoder().encode(data.temp_code + userData.hash_id)
    ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

    // Créer l'enregistrement de transfert
    const { error: insertError } = await supabaseAdmin
      .from('device_transfers')
      .insert({
        old_user_id: userId,
        hash_id: userData.hash_id,
        temp_code_hash: tempCodeHash,
        temp_code_expires_at: expiresAt.toISOString(),
        status: 'pending_temp_code',
        created_at: new Date().toISOString()
      })

    if (insertError) {
      console.error('[REGISTER-TRANSFER-TEMP] Insert error:', insertError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de l\'enregistrement' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log('[REGISTER-TRANSFER-TEMP] code temporaire enregistré')

    return new Response(
      JSON.stringify({
        success: true,
        hash_id: userData.hash_id,
        expires_at: expiresAt.toISOString(),
        validity_minutes: TEMP_CODE_VALIDITY_MINUTES
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[REGISTER-TRANSFER-TEMP] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
