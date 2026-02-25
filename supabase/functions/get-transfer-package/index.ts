// Edge Function: get-transfer-package
// Called by NEW device to retrieve the encrypted transfer package
// Requires Hash ID + transfer code (from QR code or manual entry)

import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Rate limiting strict pour empêcher bruteforce du code de transfert
const RATE_LIMIT_CONFIG = {
  maxAttempts: 5,
  windowMinutes: 10,
  blockMinutes: 60
}

interface GetTransferPackageRequest {
  hash_id: string        // Hash ID de l'utilisateur source
  transfer_code: string  // Code de transfert (TRF-XXXX-XXXX-XXXX)
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
      'get_transfer_package',
      RATE_LIMIT_CONFIG
    )

    if (!rateLimitCheck.allowed) {
      console.log('[GET-TRANSFER-PACKAGE] rate limit IP')
      return new Response(
        JSON.stringify({ error: rateLimitCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Parser la requête
    const data: GetTransferPackageRequest = await req.json()

    // Valider les entrées
    if (!data.hash_id || !data.hash_id.startsWith('#')) {
      return new Response(
        JSON.stringify({ error: 'Hash ID invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!data.transfer_code || !/^TRF-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}$/.test(data.transfer_code)) {
      return new Response(
        JSON.stringify({ error: 'Code de transfert invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Hasher le code de transfert pour comparaison
    const transferCodeHash = await crypto.subtle.digest(
      'SHA-256',
      new TextEncoder().encode(data.transfer_code + data.hash_id)
    ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

    // Chercher le transfert
    const { data: transfer, error: transferError } = await supabaseAdmin
      .from('device_transfers')
      .select('*')
      .eq('hash_id', data.hash_id)
      .eq('transfer_code_hash', transferCodeHash)
      .eq('status', 'waiting_for_new_device')
      .single()

    if (transferError || !transfer) {
      console.log('[GET-TRANSFER-PACKAGE] code de transfert invalide')
      return new Response(
        JSON.stringify({ error: 'Code de transfert invalide ou expiré' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Vérifier l'expiration
    if (new Date(transfer.transfer_code_expires_at) < new Date()) {
      console.log('[GET-TRANSFER-PACKAGE] code de transfert expiré')

      // Mettre à jour le statut
      await supabaseAdmin
        .from('device_transfers')
        .update({
          status: 'expired',
          updated_at: new Date().toISOString()
        })
        .eq('id', transfer.id)

      return new Response(
        JSON.stringify({ error: 'Code de transfert expiré' }),
        { status: 410, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Vérifier que c'est bien la même IP qui a validé le temp code
    if (transfer.new_device_ip && transfer.new_device_ip !== clientIP) {
      console.log('[GET-TRANSFER-PACKAGE] IP différente du temp code')
      // On ne bloque pas mais on log (le réseau peut changer)
    }

    // Mettre à jour le statut - en attente de confirmation de l'ancien appareil
    await supabaseAdmin
      .from('device_transfers')
      .update({
        status: 'pending_old_device_confirmation',
        updated_at: new Date().toISOString()
      })
      .eq('id', transfer.id)

    console.log('[GET-TRANSFER-PACKAGE] package récupéré')

    return new Response(
      JSON.stringify({
        success: true,
        transfer_id: transfer.id,
        encrypted_package: transfer.encrypted_package,
        proximity_code: transfer.proximity_code,
        message: 'Package récupéré. En attente de confirmation de l\'ancien appareil.'
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[GET-TRANSFER-PACKAGE] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
