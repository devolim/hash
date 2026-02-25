import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Rate limiting : 60 downloads par heure
const RATE_LIMIT_CONFIG = {
  maxAttempts: 60,
  windowMinutes: 60,
  blockMinutes: 30,
}

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const authHeader = req.headers.get('Authorization')
    if (!authHeader) {
      return new Response(
        JSON.stringify({ error: 'Authorization manquante', error_code: 'UNAUTHORIZED' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const body = await req.json()
    const { file_id } = body

    if (!file_id || typeof file_id !== 'string') {
      return new Response(
        JSON.stringify({ error: 'file_id invalide', error_code: 'INVALID_FILE_ID' }),
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

    // Valider la session
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
    const rateCheck = await checkRateLimit(
      supabaseAdmin, `user:${userId}`, 'download_media', RATE_LIMIT_CONFIG
    )
    if (!rateCheck.allowed) {
      return new Response(
        JSON.stringify({ error: rateCheck.message, error_code: 'RATE_LIMITED' }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Chercher le fichier
    const { data: mediaFile, error: selectError } = await supabaseAdmin
      .from('media_files')
      .select('*')
      .eq('id', file_id)
      .eq('is_downloaded', false)
      .gt('expires_at', new Date().toISOString())
      .single()

    if (selectError || !mediaFile) {
      return new Response(
        JSON.stringify({ error: 'expired', error_code: 'MEDIA_EXPIRED' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Générer une URL signée (5 minutes)
    const { data: signedUrl, error: signError } = await supabaseAdmin.storage
      .from('media')
      .createSignedUrl(mediaFile.storage_path, 300)

    if (signError || !signedUrl) {
      console.error('[DOWNLOAD-MEDIA] erreur URL signée:', signError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de la génération du lien', error_code: 'INTERNAL_ERROR' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log('[DOWNLOAD-MEDIA] URL signée générée')

    return new Response(
      JSON.stringify({
        success: true,
        download_url: signedUrl.signedUrl,
        file_size: mediaFile.file_size_bytes,
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[DOWNLOAD-MEDIA] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne', error_code: 'INTERNAL_ERROR' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
