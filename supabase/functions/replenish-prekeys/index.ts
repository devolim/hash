import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { validateSessionStrict } from "../_shared/session-validator.ts"
import { checkRateLimitWithCleanup, getClientIP } from "../_shared/rate-limiter.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

const RATE_LIMIT = {
  maxAttempts: 20,
  windowMinutes: 60,
  blockMinutes: 30
}

const MAX_PREKEYS = 200

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
    const { prekeys } = body

    // Validation des prekeys
    if (!Array.isArray(prekeys) || prekeys.length === 0) {
      return new Response(
        JSON.stringify({ error: 'prekeys invalides: doit être un tableau non vide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (prekeys.length > MAX_PREKEYS) {
      return new Response(
        JSON.stringify({ error: `Trop de prekeys: maximum ${MAX_PREKEYS}` }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Valider la structure de chaque prekey
    for (const pk of prekeys) {
      if (typeof pk.prekey_id !== 'number' || typeof pk.public_key !== 'string' || !pk.public_key) {
        return new Response(
          JSON.stringify({ error: 'Format de prekey invalide: prekey_id (number) et public_key (string) requis' }),
          { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
      }
    }

    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      { auth: { autoRefreshToken: false, persistSession: false } }
    )

    // Valider la session
    const session = await validateSessionStrict(supabaseAdmin, authHeader)
    if (!session.valid || !session.userId) {
      return new Response(
        JSON.stringify({ error: session.error ?? 'Session invalide' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Rate limiting
    const clientIP = getClientIP(req)
    const rateLimitCheck = await checkRateLimitWithCleanup(
      supabaseAdmin, `user:${session.userId}:replenish`, 'replenish_prekeys', RATE_LIMIT
    )
    if (!rateLimitCheck.allowed) {
      return new Response(
        JSON.stringify({ error: rateLimitCheck.message }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Insérer les prekeys
    const prekeysToInsert = prekeys.map((pk: { prekey_id: number; public_key: string }) => ({
      user_id: session.userId,
      prekey_id: pk.prekey_id,
      public_key: pk.public_key
    }))

    const { error: insertError } = await supabaseAdmin
      .from('prekeys')
      .upsert(prekeysToInsert, { onConflict: 'user_id,prekey_id' })

    if (insertError) {
      console.error('[REPLENISH-PREKEYS] erreur insertion:', insertError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de l\'insertion des prekeys' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Compter le total après insertion
    const { count, error: countError } = await supabaseAdmin
      .from('prekeys')
      .select('*', { count: 'exact', head: true })
      .eq('user_id', session.userId)

    if (countError) {
      console.error('[REPLENISH-PREKEYS] erreur count:', countError)
    }

    return new Response(
      JSON.stringify({ count: count ?? prekeys.length }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[REPLENISH-PREKEYS] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
