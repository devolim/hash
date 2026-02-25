import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

/**
 * Acknowledge that a contact exchange is complete.
 *
 * After the requester has fetched the accepted request and stored
 * the acceptor's keys locally, they call this to DELETE the
 * contact_request row from the server.
 *
 * This ensures no trace of who added who remains on the server.
 *
 * Input: JWT + { request_id }
 */
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
    const { request_id } = body

    if (!request_id || typeof request_id !== 'string') {
      return new Response(
        JSON.stringify({ error: 'request_id requis' }),
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

    // Validate session
    const sessionCheck = await validateSessionStrict(supabaseAdmin, authHeader, supabaseUser)
    if (!sessionCheck.valid) {
      return new Response(
        JSON.stringify({ error: sessionCheck.error || 'Session invalide' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const userId = sessionCheck.userId!

    // Get the request
    const { data: request, error: requestError } = await supabaseAdmin
      .from('contact_requests')
      .select('id, requester_id, status')
      .eq('id', request_id)
      .single()

    if (requestError || !request) {
      return new Response(
        JSON.stringify({ error: 'Demande non trouvée' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Verify the user is the requester (only requester can acknowledge)
    if (request.requester_id !== userId) {
      return new Response(
        JSON.stringify({ error: 'Non autorisé' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Verify the request is accepted
    if (request.status !== 'accepted') {
      return new Response(
        JSON.stringify({ error: 'Demande pas encore acceptée' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // DELETE the contact_request row — no trace left
    const { error: deleteError } = await supabaseAdmin
      .from('contact_requests')
      .delete()
      .eq('id', request_id)

    if (deleteError) {
      console.error('[ACKNOWLEDGE-CONTACT-EXCHANGE] erreur suppression:', deleteError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de la suppression' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log('[ACKNOWLEDGE-CONTACT-EXCHANGE] demande supprimée')

    return new Response(
      JSON.stringify({ success: true }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[ACKNOWLEDGE-CONTACT-EXCHANGE] erreur:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
