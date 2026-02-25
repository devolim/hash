// Edge Function: confirm-transfer-complete
// Called by NEW device after successful decryption and PIN setup
// This completes the transfer by:
// 1. Updating the user's device_id to the new device
// 2. Regenerating Signal Protocol keys
// 3. Invalidating old device sessions
// 4. Marking transfer as complete

import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Rate limiting
const RATE_LIMIT_CONFIG = {
  maxAttempts: 3,
  windowMinutes: 30,
  blockMinutes: 120
}

interface ConfirmTransferRequest {
  transfer_id: string           // ID du transfert
  hash_id: string              // Hash ID de l'utilisateur (vérification)
  new_device_id: string        // ID du nouvel appareil
  identity_public_key: string  // Nouvelle clé publique d'identité
  signed_prekey_public: string
  signed_prekey_signature: string
  signed_prekey_id: number
  prekeys: Array<{ prekey_id: number; public_key: string }>
}

// Validate base64 encoded key
function isValidBase64Key(key: string, minLength = 32): boolean {
  try {
    const decoded = atob(key)
    return decoded.length >= minLength
  } catch {
    return false
  }
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

    // Rate limiting
    const rateLimitCheck = await checkRateLimit(
      supabaseAdmin,
      `ip:${clientIP}`,
      'confirm_transfer',
      RATE_LIMIT_CONFIG
    )

    if (!rateLimitCheck.allowed) {
      console.log('[CONFIRM-TRANSFER] rate limit IP')
      return new Response(
        JSON.stringify({ error: rateLimitCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Parser la requête
    const data: ConfirmTransferRequest = await req.json()

    // Valider les entrées
    if (!data.transfer_id || !data.hash_id || !data.new_device_id) {
      return new Response(
        JSON.stringify({ error: 'Paramètres manquants' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Valider les clés Signal
    if (!isValidBase64Key(data.identity_public_key)) {
      return new Response(
        JSON.stringify({ error: 'Clé d\'identité invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!isValidBase64Key(data.signed_prekey_public)) {
      return new Response(
        JSON.stringify({ error: 'Signed prekey invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!Array.isArray(data.prekeys) || data.prekeys.length < 10) {
      return new Response(
        JSON.stringify({ error: 'Au moins 10 prekeys requises' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Récupérer le transfert
    const { data: transfer, error: transferError } = await supabaseAdmin
      .from('device_transfers')
      .select('*')
      .eq('id', data.transfer_id)
      .eq('hash_id', data.hash_id)
      .eq('status', 'pending_old_device_confirmation')
      .single()

    if (transferError || !transfer) {
      console.log('[CONFIRM-TRANSFER] transfert non trouvé')
      return new Response(
        JSON.stringify({ error: 'Transfert non trouvé ou statut invalide' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Hasher le nouveau device_id
    const newDeviceHash = await crypto.subtle.digest(
      'SHA-256',
      new TextEncoder().encode(data.new_device_id)
    ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

    // Vérifier que le nouveau device_id n'est pas déjà utilisé
    const { data: existingDevice } = await supabaseAdmin
      .from('users')
      .select('id')
      .eq('device_id', newDeviceHash)
      .single()

    if (existingDevice) {
      return new Response(
        JSON.stringify({ error: 'Ce device est déjà enregistré' }),
        { status: 409, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const userId = transfer.old_user_id
    const sessionInvalidationTime = new Date().toISOString()

    // ============================================================
    // TRANSACTION: Transfert du compte
    // ============================================================

    console.log('[CONFIRM-TRANSFER] début du transfert')

    // 1. INVALIDER TOUTES LES SESSIONS EXISTANTES
    // Méthode 1: Utiliser signOut global (révoque tous les refresh tokens)
    try {
      // @ts-ignore - La méthode existe mais le typage peut être incomplet
      await supabaseAdmin.auth.admin.signOut(userId, 'global')
      console.log('[CONFIRM-TRANSFER] toutes les sessions déconnectées')
    } catch (signOutError) {
      // Si signOut échoue, on continue quand même (fallback sur session_valid_after)
      console.log(`[CONFIRM-TRANSFER] signOut failed, using session_valid_after fallback`)
    }

    // 2. Supprimer les anciennes prekeys
    await supabaseAdmin.from('prekeys').delete().eq('user_id', userId)

    // 3. Mettre à jour l'utilisateur avec le nouveau device et nouvelles clés
    // + session_valid_after pour invalider tous les anciens tokens
    const { error: updateUserError } = await supabaseAdmin
      .from('users')
      .update({
        device_id: newDeviceHash,
        identity_public_key: data.identity_public_key,
        signed_prekey_public: data.signed_prekey_public,
        signed_prekey_signature: data.signed_prekey_signature,
        signed_prekey_id: data.signed_prekey_id,
        session_valid_after: sessionInvalidationTime // ← Invalide tous les tokens émis avant
      })
      .eq('id', userId)

    if (updateUserError) {
      console.error('[CONFIRM-TRANSFER] Update user error:', updateUserError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de la mise à jour utilisateur' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // 4. Ajouter les nouvelles prekeys
    const prekeysToInsert = data.prekeys.map(pk => ({
      user_id: userId,
      prekey_id: pk.prekey_id,
      public_key: pk.public_key
    }))

    await supabaseAdmin.from('prekeys').insert(prekeysToInsert)

    // 5. Marquer le transfert comme complété
    await supabaseAdmin
      .from('device_transfers')
      .update({
        status: 'completed',
        new_device_id: newDeviceHash,
        completed_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
      })
      .eq('id', transfer.id)

    // 6. Créer une nouvelle session pour le nouvel appareil
    const { data: session, error: sessionError } = await supabaseAdmin.auth.admin.createSession({
      user_id: userId
    })

    if (sessionError) {
      console.error('[CONFIRM-TRANSFER] Session error:', sessionError)
      return new Response(
        JSON.stringify({ error: 'Erreur création session' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log('[CONFIRM-TRANSFER] transfert complété')

    return new Response(
      JSON.stringify({
        success: true,
        user_id: userId,
        hash_id: data.hash_id,
        access_token: session.session?.access_token,
        refresh_token: session.session?.refresh_token,
        message: 'Transfert complété avec succès'
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[CONFIRM-TRANSFER] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
