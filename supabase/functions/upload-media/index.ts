import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { checkRateLimit, getClientIP } from "../_shared/rate-limiter.ts"
import { validateSessionStrict } from "../_shared/session-validator.ts"

// Génère un hash anonyme HMAC-SHA256 du userId
// Permet les quotas sans stocker l'identité réelle
async function anonymizeUserId(userId: string): Promise<string> {
  const encoder = new TextEncoder()
  const keyData = encoder.encode(Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '')
  const key = await crypto.subtle.importKey(
    'raw', keyData, { name: 'HMAC', hash: 'SHA-256' }, false, ['sign']
  )
  const signature = await crypto.subtle.sign('HMAC', key, encoder.encode(userId))
  return Array.from(new Uint8Array(signature))
    .map(b => b.toString(16).padStart(2, '0'))
    .join('')
}

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type, x-file-size, x-content-type',
}

// Rate limiting : 30 uploads par heure
const RATE_LIMIT_CONFIG = {
  maxAttempts: 30,
  windowMinutes: 60,
  blockMinutes: 60,
}

// Limites de taille par type MIME (par défaut, surchargé par app_config.max_file_size_mb)
const DEFAULT_SIZE_LIMITS: Record<string, number> = {
  'image': 10 * 1024 * 1024,   // 10 Mo
  'video': 100 * 1024 * 1024,  // 100 Mo
  'audio': 5 * 1024 * 1024,    // 5 Mo
}
const DEFAULT_FILE_SIZE_LIMIT = 25 * 1024 * 1024 // 25 Mo pour les fichiers

// Will be populated from app_config at runtime
let SIZE_LIMITS: Record<string, number> = { ...DEFAULT_SIZE_LIMITS }
let FILE_SIZE_LIMIT = DEFAULT_FILE_SIZE_LIMIT

// Quotas
const USER_QUOTA_BYTES = 200 * 1024 * 1024     // 200 Mo par utilisateur en transit
const GLOBAL_QUOTA_BYTES = 20 * 1024 * 1024 * 1024 // 20 Go global

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

    // Lire les métadonnées depuis les headers
    const fileSizeStr = req.headers.get('X-File-Size')
    const contentType = req.headers.get('X-Content-Type') || 'application/octet-stream'

    if (!fileSizeStr) {
      return new Response(
        JSON.stringify({ error: 'X-File-Size manquant', error_code: 'MISSING_FILE_SIZE' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const fileSize = parseInt(fileSizeStr, 10)
    if (isNaN(fileSize) || fileSize <= 0) {
      return new Response(
        JSON.stringify({ error: 'Taille de fichier invalide', error_code: 'INVALID_FILE_SIZE' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      { auth: { autoRefreshToken: false, persistSession: false } }
    )

    // Fetch config from app_config
    let expiryHours = 24
    try {
      const { data: configRow } = await supabaseAdmin
        .from('app_config')
        .select('max_file_size_mb, message_expiry_hours')
        .single()
      if (configRow?.max_file_size_mb) {
        const maxMb = configRow.max_file_size_mb
        SIZE_LIMITS = {
          'image': maxMb * 1024 * 1024,
          'video': Math.min(maxMb * 10, 100) * 1024 * 1024,  // video: 10x le max, plafonné à 100 Mo
          'audio': Math.max(Math.floor(maxMb / 2), 5) * 1024 * 1024,  // audio: moitié du max, min 5 Mo
        }
        FILE_SIZE_LIMIT = Math.max(maxMb * 2.5, 25) * 1024 * 1024  // fichiers: 2.5x le max, min 25 Mo
      }
      if (configRow?.message_expiry_hours) {
        expiryHours = configRow.message_expiry_hours
      }
    } catch (_) { /* use defaults */ }

    // Vérifier la limite de taille selon le type
    const mimeCategory = contentType.split('/')[0]
    const sizeLimit = SIZE_LIMITS[mimeCategory] || FILE_SIZE_LIMIT
    if (fileSize > sizeLimit) {
      return new Response(
        JSON.stringify({ error: `Fichier trop volumineux (max ${Math.round(sizeLimit / 1024 / 1024)} Mo pour ${mimeCategory})`, error_code: 'MESSAGE_TOO_LARGE' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Lire le body (blob chiffré brut)
    const body = await req.arrayBuffer()
    if (body.byteLength === 0) {
      return new Response(
        JSON.stringify({ error: 'Body vide', error_code: 'EMPTY_BODY' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Vérifier que la taille déclarée correspond à la taille réelle
    const actualSize = body.byteLength
    if (actualSize !== fileSize) {
      return new Response(
        JSON.stringify({ error: `Taille déclarée (${fileSize}) ne correspond pas à la taille réelle (${actualSize})`, error_code: 'SIZE_MISMATCH' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

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
      supabaseAdmin, `user:${userId}`, 'upload_media', RATE_LIMIT_CONFIG
    )
    if (!rateCheck.allowed) {
      return new Response(
        JSON.stringify({ error: rateCheck.message, error_code: 'RATE_LIMITED' }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Rate limiting IP
    const ipCheck = await checkRateLimit(
      supabaseAdmin, `ip:${clientIP}`, 'upload_media', { maxAttempts: 60, windowMinutes: 60, blockMinutes: 30 }
    )
    if (!ipCheck.allowed) {
      return new Response(
        JSON.stringify({ error: ipCheck.message, error_code: 'RATE_LIMITED' }),
        { status: 429, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Hash anonyme du userId pour les quotas (non-traçable)
    const anonId = await anonymizeUserId(userId)

    // Vérifier quota utilisateur (via hash anonyme)
    const { data: userQuota } = await supabaseAdmin
      .from('user_media_quota')
      .select('total_bytes')
      .eq('uploader_id', anonId)
      .single()

    const currentUserBytes = userQuota?.total_bytes || 0
    if (currentUserBytes + fileSize > USER_QUOTA_BYTES) {
      return new Response(
        JSON.stringify({ error: 'Quota utilisateur dépassé (200 Mo max en transit)', error_code: 'QUOTA_EXCEEDED' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Vérifier quota global
    const { data: globalQuota } = await supabaseAdmin
      .from('global_media_quota')
      .select('total_bytes')
      .single()

    const currentGlobalBytes = globalQuota?.total_bytes || 0
    if (currentGlobalBytes + fileSize > GLOBAL_QUOTA_BYTES) {
      return new Response(
        JSON.stringify({ error: 'Stockage serveur saturé, réessayez plus tard', error_code: 'SERVER_FULL' }),
        { status: 503, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Générer un ID unique pour le fichier (pas de userId dans le path)
    const fileId = crypto.randomUUID()
    const storagePath = fileId

    // Upload dans le bucket
    const { error: uploadError } = await supabaseAdmin.storage
      .from('media')
      .upload(storagePath, body, {
        contentType: 'application/octet-stream',
        upsert: false,
      })

    if (uploadError) {
      console.error('[UPLOAD-MEDIA] erreur upload stockage:', uploadError)
      return new Response(
        JSON.stringify({ error: 'Erreur lors de l\'upload', error_code: 'UPLOAD_ERROR' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Insérer dans la table de suivi (hash anonyme, pas de mime_type)
    const expiresAt = new Date(Date.now() + expiryHours * 60 * 60 * 1000).toISOString()
    const { error: insertError } = await supabaseAdmin
      .from('media_files')
      .insert({
        id: fileId,
        uploader_id: anonId,
        storage_path: storagePath,
        file_size_bytes: fileSize,
        expires_at: expiresAt,
      })

    if (insertError) {
      console.error('[UPLOAD-MEDIA] erreur insertion:', insertError)
      // Rollback : supprimer le fichier du bucket
      await supabaseAdmin.storage.from('media').remove([storagePath])
      return new Response(
        JSON.stringify({ error: 'Erreur lors de l\'enregistrement', error_code: 'INSERT_ERROR' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log('[UPLOAD-MEDIA] fichier uploadé')

    return new Response(
      JSON.stringify({
        success: true,
        file_id: fileId,
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[UPLOAD-MEDIA] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne', error_code: 'INTERNAL_ERROR' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
