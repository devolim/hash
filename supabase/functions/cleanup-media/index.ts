import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

// Appelée par pg_cron via pg_net — pas de CORS public
serve(async (req) => {
  try {
    // Authentification : secret partagé entre pg_net et cette fonction
    const cronSecret = Deno.env.get('CRON_SECRET')
    const incoming = req.headers.get('x-cron-secret')

    if (!cronSecret || incoming !== cronSecret) {
      return new Response(
        JSON.stringify({ error: 'Unauthorized' }),
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      )
    }

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      { auth: { autoRefreshToken: false, persistSession: false } }
    )

    let totalDeleted = 0
    let orphansDeleted = 0

    // ----------------------------------------------------------------
    // 1. Fichiers expirés non téléchargés
    // ----------------------------------------------------------------
    const { data: expiredFiles } = await supabase
      .from('media_files')
      .select('id, storage_path')
      .lt('expires_at', new Date().toISOString())
      .eq('is_downloaded', false)

    if (expiredFiles && expiredFiles.length > 0) {
      const paths = expiredFiles.map((f: any) => f.storage_path)
      await supabase.storage.from('media').remove(paths)
      const ids = expiredFiles.map((f: any) => f.id)
      await supabase.from('media_files').delete().in('id', ids)
      totalDeleted += expiredFiles.length
      console.log(`[CLEANUP-MEDIA] expirés supprimés: ${expiredFiles.length}`)
    }

    // ----------------------------------------------------------------
    // 2. Fichiers déjà téléchargés depuis plus d'1h
    // ----------------------------------------------------------------
    const oneHourAgo = new Date(Date.now() - 60 * 60 * 1000).toISOString()
    const { data: downloadedFiles } = await supabase
      .from('media_files')
      .select('id, storage_path')
      .eq('is_downloaded', true)
      .lt('downloaded_at', oneHourAgo)

    if (downloadedFiles && downloadedFiles.length > 0) {
      const paths = downloadedFiles.map((f: any) => f.storage_path)
      await supabase.storage.from('media').remove(paths)
      const ids = downloadedFiles.map((f: any) => f.id)
      await supabase.from('media_files').delete().in('id', ids)
      totalDeleted += downloadedFiles.length
      console.log(`[CLEANUP-MEDIA] téléchargés supprimés: ${downloadedFiles.length}`)
    }

    // ----------------------------------------------------------------
    // 3. Filet de sécurité : orphelins dans le bucket (âgés de +1h)
    //    Fichiers présents dans storage mais sans entrée media_files
    // ----------------------------------------------------------------
    const { data: storageObjects } = await supabase.storage
      .from('media')
      .list('', { limit: 1000 })

    if (storageObjects && storageObjects.length > 0) {
      // Récupérer tous les storage_path connus en DB
      const { data: knownFiles } = await supabase
        .from('media_files')
        .select('storage_path')

      const knownPaths = new Set((knownFiles ?? []).map((f: any) => f.storage_path))
      const oneHourAgoDate = new Date(Date.now() - 60 * 60 * 1000)

      const orphanPaths = storageObjects
        .filter((obj: any) => {
          if (knownPaths.has(obj.name)) return false
          // Grace period : ignorer les fichiers créés il y a moins d'1h
          const createdAt = obj.created_at ? new Date(obj.created_at) : new Date()
          return createdAt < oneHourAgoDate
        })
        .map((obj: any) => obj.name)

      if (orphanPaths.length > 0) {
        await supabase.storage.from('media').remove(orphanPaths)
        orphansDeleted = orphanPaths.length
        console.log(`[CLEANUP-MEDIA] orphelins supprimés: ${orphanPaths.length}`)
      }
    }

    return new Response(
      JSON.stringify({
        success: true,
        deleted: totalDeleted,
        orphans_deleted: orphansDeleted,
      }),
      { status: 200, headers: { 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[CLEANUP-MEDIA] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    )
  }
})
