import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { validateSessionStrict } from "../_shared/session-validator.ts"

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

    const body = await req.json()
    const { file_id } = body

    if (!file_id || typeof file_id !== 'string') {
      return new Response(
        JSON.stringify({ error: 'file_id invalide' }),
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

    // Chercher le fichier
    const { data: mediaFile, error: selectError } = await supabaseAdmin
      .from('media_files')
      .select('*')
      .eq('id', file_id)
      .single()

    if (selectError || !mediaFile) {
      return new Response(
        JSON.stringify({ error: 'Fichier non trouvé' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Idempotent : si déjà downloaded, retourner success
    if (mediaFile.is_downloaded) {
      return new Response(
        JSON.stringify({ success: true, already_acknowledged: true }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Supprimer le fichier du bucket
    const { error: removeError } = await supabaseAdmin.storage
      .from('media')
      .remove([mediaFile.storage_path])

    if (removeError) {
      console.error('[ACKNOWLEDGE-MEDIA] erreur suppression stockage:', removeError)
      // On continue quand même pour marquer comme downloaded
    }

    // Nettoyer le dossier vide résiduel
    try {
      const { data: remaining } = await supabaseAdmin.storage
        .from('media')
        .list(mediaFile.storage_path)

      if (remaining && remaining.length > 0) {
        const toRemove = remaining.map((f: any) => `${mediaFile.storage_path}/${f.name}`)
        await supabaseAdmin.storage.from('media').remove(toRemove)
      }
    } catch (_) {
      // Ignorer — le dossier n'existe peut-être pas
    }

    // Marquer comme téléchargé
    const { error: updateError } = await supabaseAdmin
      .from('media_files')
      .update({
        is_downloaded: true,
        downloaded_at: new Date().toISOString(),
      })
      .eq('id', file_id)

    if (updateError) {
      console.error('[ACKNOWLEDGE-MEDIA] erreur mise à jour:', updateError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de la confirmation' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log('[ACKNOWLEDGE-MEDIA] fichier confirmé')

    return new Response(
      JSON.stringify({ success: true }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[ACKNOWLEDGE-MEDIA] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
