import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    // Get the authorization header
    const authHeader = req.headers.get('Authorization')
    if (!authHeader) {
      return new Response(
        JSON.stringify({ error: 'Missing authorization header' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Create Supabase client with service role (full access)
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      {
        auth: {
          autoRefreshToken: false,
          persistSession: false
        }
      }
    )

    // Create client with user's token to verify identity
    const supabaseUser = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      {
        global: {
          headers: { Authorization: authHeader }
        },
        auth: {
          autoRefreshToken: false,
          persistSession: false
        }
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

    // Vérifier que l'utilisateur existe dans la table users
    const { data: userData, error: userError } = await supabaseAdmin
      .from('users')
      .select('id, hash_id')
      .eq('id', userId)
      .single()

    if (userError || !userData) {
      return new Response(
        JSON.stringify({ error: 'User not found in database' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // ============================================================
    // SUPPRESSION DES DONNÉES (garde le compte, supprime le contenu)
    // ============================================================

    const deletionResults: Record<string, string> = {}

    // 1. Supprimer les messages en attente (reçus par cet utilisateur)
    const { error: pendingReceivedError } = await supabaseAdmin
      .from('pending_messages')
      .delete()
      .eq('recipient_id', userId)

    deletionResults['pending_messages_received'] = pendingReceivedError
      ? `Error: ${pendingReceivedError.message}`
      : 'OK'

    // 2. Supprimer les messages en attente (envoyés par cet utilisateur)
    const { error: pendingSentError } = await supabaseAdmin
      .from('pending_messages')
      .delete()
      .eq('sender_id', userId)

    deletionResults['pending_messages_sent'] = pendingSentError
      ? `Error: ${pendingSentError.message}`
      : 'OK'

    // 3. Supprimer les codes temporaires
    const { error: codesError } = await supabaseAdmin
      .from('temporary_codes')
      .delete()
      .eq('user_id', userId)

    deletionResults['temporary_codes'] = codesError
      ? `Error: ${codesError.message}`
      : 'OK'

    // Note: On ne supprime PAS les prekeys car ils sont nécessaires
    // pour que d'autres utilisateurs puissent initier une conversation
    // On ne supprime PAS non plus l'entrée dans users (garder l'identité)

    // Log pour audit
    console.log('[CLEANUP] données nettoyées')

    return new Response(
      JSON.stringify({
        success: true,
        message: 'User data cleaned up successfully',
        hash_id: userData.hash_id,
        details: deletionResults,
        timestamp: new Date().toISOString()
      }),
      {
        status: 200,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' }
      }
    )

  } catch (error) {
    console.error('Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Internal server error' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
