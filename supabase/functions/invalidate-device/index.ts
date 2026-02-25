// Edge Function: invalidate-device
// Called by OLD device after transfer is confirmed by new device
// This cleans up the old device's server-side state
// Note: The old device should NOT be able to call this after transfer is complete
//       since its tokens are invalidated - this is a safety cleanup

import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { getClientIP } from "../_shared/rate-limiter.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
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

    // Vérifier l'authentification
    const { data: { user }, error: authError } = await supabaseUser.auth.getUser()
    if (authError || !user) {
      // Si le token est invalide, c'est probablement car le transfert est déjà fait
      // Dans ce cas, on retourne un succès (le but est atteint)
      console.log('[INVALIDATE-DEVICE] Token already invalid - transfer likely complete')
      return new Response(
        JSON.stringify({ success: true, message: 'Appareil déjà invalidé' }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const userId = user.id
    const clientIP = getClientIP(req)

    // Récupérer les infos utilisateur
    const { data: userData, error: userError } = await supabaseAdmin
      .from('users')
      .select('id, hash_id, device_id')
      .eq('id', userId)
      .single()

    if (userError || !userData) {
      // L'utilisateur n'existe plus - probablement déjà transféré
      console.log('[INVALIDATE-DEVICE] User not found - may have been transferred')
      return new Response(
        JSON.stringify({ success: true, message: 'Compte transféré' }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Vérifier s'il y a un transfert complété pour cet utilisateur
    const { data: transfer } = await supabaseAdmin
      .from('device_transfers')
      .select('*')
      .eq('old_user_id', userId)
      .eq('status', 'completed')
      .order('completed_at', { ascending: false })
      .limit(1)
      .single()

    if (transfer) {
      console.log('[INVALIDATE-DEVICE] transfert déjà complété')

      // Le transfert est déjà fait, l'ancien device ne devrait plus avoir accès
      // On ne fait rien de plus côté serveur car tout a été mis à jour
      // lors du confirm-transfer-complete

      return new Response(
        JSON.stringify({
          success: true,
          message: 'Transfert complété. Veuillez supprimer les données locales.'
        }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // S'il n'y a pas de transfert complété, on vérifie s'il y en a un en cours
    const { data: pendingTransfer } = await supabaseAdmin
      .from('device_transfers')
      .select('*')
      .eq('old_user_id', userId)
      .neq('status', 'completed')
      .neq('status', 'cancelled')
      .neq('status', 'expired')
      .single()

    if (pendingTransfer) {
      // Il y a un transfert en cours, on ne peut pas invalider
      return new Response(
        JSON.stringify({ error: 'Transfert en cours - veuillez compléter ou annuler' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Pas de transfert en cours ou complété - cet appel ne devrait pas arriver
    console.log('[INVALIDATE-DEVICE] aucun transfert trouvé')

    return new Response(
      JSON.stringify({ error: 'Aucun transfert trouvé' }),
      { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[INVALIDATE-DEVICE] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
