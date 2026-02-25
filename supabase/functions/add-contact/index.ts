import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Rate limiting pour l'ajout de contacts
const RATE_LIMIT_CONFIG = {
  maxAttempts: 20,     // 20 ajouts max
  windowMinutes: 60,   // Par heure
  blockMinutes: 120    // Bloqué 2h si dépassé
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

    const body = await req.json()
    const { target_hash_id, temporary_code } = body

    // Validation
    if (!target_hash_id || typeof target_hash_id !== 'string') {
      return new Response(
        JSON.stringify({ error: 'target_hash_id invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!temporary_code || typeof temporary_code !== 'string') {
      return new Response(
        JSON.stringify({ error: 'temporary_code invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Valider le format du hash_id (XXX-XXX-XXX)
    const hashIdRegex = /^[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{3}$/
    if (!hashIdRegex.test(target_hash_id.toUpperCase())) {
      return new Response(
        JSON.stringify({ error: 'Format hash_id invalide' }),
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

    // Vérifier que l'utilisateur existe
    const { data: senderData, error: senderError } = await supabaseAdmin
      .from('users')
      .select('id, hash_id')
      .eq('id', userId)
      .single()

    if (senderError || !senderData) {
      return new Response(
        JSON.stringify({ error: 'Utilisateur non trouvé' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Empêcher de s'ajouter soi-même
    if (senderData.hash_id.toUpperCase() === target_hash_id.toUpperCase()) {
      return new Response(
        JSON.stringify({ error: 'Vous ne pouvez pas vous ajouter vous-même' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Rate limiting
    const userCheck = await checkRateLimit(
      supabaseAdmin, `user:${userId}`, 'add_contact', RATE_LIMIT_CONFIG
    )
    if (!userCheck.allowed) {
      console.log('[ADD-CONTACT] rate limit utilisateur')
      return new Response(
        JSON.stringify({ error: userCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const ipCheck = await checkRateLimit(
      supabaseAdmin, `ip:${clientIP}`, 'add_contact', 
      { maxAttempts: 50, windowMinutes: 60, blockMinutes: 60 }
    )
    if (!ipCheck.allowed) {
      console.log('[ADD-CONTACT] rate limit IP')
      return new Response(
        JSON.stringify({ error: ipCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Chercher l'utilisateur cible
    const { data: targetUser, error: targetError } = await supabaseAdmin
      .from('users')
      .select('id, hash_id, identity_public_key, signed_prekey_public, signed_prekey_signature, signed_prekey_id')
      .eq('hash_id', target_hash_id.toUpperCase())
      .single()

    if (targetError || !targetUser) {
      return new Response(
        JSON.stringify({ error: 'Utilisateur non trouvé' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Vérifier le code temporaire
    const { data: codeData, error: codeError } = await supabaseAdmin
      .from('temporary_codes')
      .select('*')
      .eq('user_id', targetUser.id)
      .eq('code', temporary_code)
      .gt('expires_at', new Date().toISOString())
      .single()

    if (codeError || !codeData) {
      return new Response(
        JSON.stringify({ error: 'Code temporaire invalide ou expiré' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Supprimer le code utilisé
    await supabaseAdmin
      .from('temporary_codes')
      .delete()
      .eq('id', codeData.id)

    // Récupérer une prekey
    const { data: prekey, error: prekeyError } = await supabaseAdmin
      .from('prekeys')
      .select('*')
      .eq('user_id', targetUser.id)
      .limit(1)
      .single()

    if (prekeyError || !prekey) {
      return new Response(
        JSON.stringify({ error: 'Aucune prekey disponible pour ce contact' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Supprimer la prekey utilisée
    await supabaseAdmin
      .from('prekeys')
      .delete()
      .eq('id', prekey.id)

    console.log('[ADD-CONTACT] contact ajouté')

    return new Response(
      JSON.stringify({
        success: true,
        contact: {
          user_id: targetUser.id,
          hash_id: targetUser.hash_id,
          identity_public_key: targetUser.identity_public_key,
          signed_prekey_public: targetUser.signed_prekey_public,
          signed_prekey_signature: targetUser.signed_prekey_signature,
          signed_prekey_id: targetUser.signed_prekey_id,
          prekey_id: prekey.prekey_id,
          prekey_public: prekey.public_key
        },
        timestamp: new Date().toISOString()
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[ADD-CONTACT] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
