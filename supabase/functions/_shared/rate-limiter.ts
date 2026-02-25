import { SupabaseClient } from "https://esm.sh/@supabase/supabase-js@2"

/**
 * Anonymise les identifiants sensibles (IP, device) via SHA-256 + salt.
 * Les identifiants user:, call:, call-token: ne sont PAS hashés (déjà pseudonymes).
 */
export async function anonymizeIdentifier(identifier: string): Promise<string> {
  if (identifier.startsWith('ip:') || identifier.startsWith('device:')) {
    const salt = Deno.env.get('RATE_LIMIT_SALT')
    if (!salt) {
      console.warn('[RATE-LIMITER] RATE_LIMIT_SALT not set, using fallback. Set a random 32+ char value in production!')
    }
    const effectiveSalt = salt || 'hash-app-rl-v1'
    const prefix = identifier.split(':')[0]
    const raw = identifier.substring(prefix.length + 1)
    const data = new TextEncoder().encode(effectiveSalt + ':' + raw)
    const hashBuffer = await crypto.subtle.digest('SHA-256', data)
    const hash = Array.from(new Uint8Array(hashBuffer))
      .map(b => b.toString(16).padStart(2, '0'))
      .join('')
    return `${prefix}:${hash}`
  }
  return identifier
}

export interface RateLimitConfig {
  maxAttempts: number      // Nombre max de tentatives
  windowMinutes: number    // Fenêtre de temps en minutes
  blockMinutes: number     // Durée du blocage en minutes
}

// Configs par défaut plus souples (pour dev et prod)
export const DEFAULT_CONFIGS: Record<string, RateLimitConfig> = {
  register: { maxAttempts: 10, windowMinutes: 60, blockMinutes: 30 },
  send_message: { maxAttempts: 100, windowMinutes: 5, blockMinutes: 5 },
  send_message_pair: { maxAttempts: 200, windowMinutes: 5, blockMinutes: 5 },
  contact_request: { maxAttempts: 30, windowMinutes: 60, blockMinutes: 15 },
  validate_code: { maxAttempts: 20, windowMinutes: 10, blockMinutes: 10 },
  delete_account: { maxAttempts: 5, windowMinutes: 60, blockMinutes: 60 },
}

export interface RateLimitResult {
  allowed: boolean
  remainingAttempts: number
  blockedUntil: Date | null
  message: string
}

/**
 * Rate Limiter utilisant la table rate_limits de Supabase
 * Protège contre les abus et les attaques par force brute
 */
export async function checkRateLimit(
  supabase: SupabaseClient,
  identifier: string,  // IP, userId, deviceId, etc.
  actionType: string,  // 'register', 'send_message', 'delete_account', etc.
  config: RateLimitConfig
): Promise<RateLimitResult> {
  const now = new Date()

  // Anonymiser les identifiants sensibles (IP, device) avant stockage
  const anonIdentifier = await anonymizeIdentifier(identifier)

  // Chercher un enregistrement existant
  const { data: existing, error: selectError } = await supabase
    .from('rate_limits')
    .select('*')
    .eq('identifier', anonIdentifier)
    .eq('action_type', actionType)
    .single()

  if (selectError && selectError.code !== 'PGRST116') {
    // Erreur autre que "not found" — fail closed
    console.error('Rate limit check error:', selectError)
    return {
      allowed: false,
      remainingAttempts: 0,
      blockedUntil: null,
      message: 'Rate limit check failed'
    }
  }

  // Si bloqué, vérifier si le blocage est expiré
  if (existing?.blocked_until) {
    const blockedUntil = new Date(existing.blocked_until)
    if (now < blockedUntil) {
      return {
        allowed: false,
        remainingAttempts: 0,
        blockedUntil,
        message: `Trop de tentatives. Réessayez après ${blockedUntil.toLocaleTimeString('fr-FR')}`
      }
    }
    // Blocage expiré, reset with compare-and-swap
    const { data: resetData } = await supabase
      .from('rate_limits')
      .update({
        attempts: 1,
        first_attempt_at: now.toISOString(),
        blocked_until: null
      })
      .eq('id', existing.id)
      .eq('blocked_until', existing.blocked_until)
      .select('id')

    if (!resetData || resetData.length === 0) {
      // Another request already reset — re-check
      return checkRateLimit(supabase, identifier, actionType, config)
    }

    return {
      allowed: true,
      remainingAttempts: config.maxAttempts - 1,
      blockedUntil: null,
      message: 'OK'
    }
  }

  // Si pas d'enregistrement existant, créer
  if (!existing) {
    await supabase
      .from('rate_limits')
      .insert({
        identifier: anonIdentifier,
        action_type: actionType,
        attempts: 1,
        first_attempt_at: now.toISOString()
      })

    return {
      allowed: true,
      remainingAttempts: config.maxAttempts - 1,
      blockedUntil: null,
      message: 'OK'
    }
  }

  // Vérifier si la fenêtre de temps est expirée
  const firstAttempt = new Date(existing.first_attempt_at)
  const windowExpiry = new Date(firstAttempt.getTime() + config.windowMinutes * 60 * 1000)

  if (now > windowExpiry) {
    // Fenêtre expirée, reset with compare-and-swap
    const { data: resetData } = await supabase
      .from('rate_limits')
      .update({
        attempts: 1,
        first_attempt_at: now.toISOString(),
        blocked_until: null
      })
      .eq('id', existing.id)
      .eq('attempts', existing.attempts)
      .select('id')

    if (!resetData || resetData.length === 0) {
      // Another request already reset — re-check
      return checkRateLimit(supabase, identifier, actionType, config)
    }

    return {
      allowed: true,
      remainingAttempts: config.maxAttempts - 1,
      blockedUntil: null,
      message: 'OK'
    }
  }

  // Incrémenter les tentatives
  const newAttempts = existing.attempts + 1

  if (newAttempts > config.maxAttempts) {
    // Bloquer
    const blockedUntil = new Date(now.getTime() + config.blockMinutes * 60 * 1000)

    await supabase
      .from('rate_limits')
      .update({
        attempts: newAttempts,
        blocked_until: blockedUntil.toISOString()
      })
      .eq('id', existing.id)

    return {
      allowed: false,
      remainingAttempts: 0,
      blockedUntil,
      message: `Trop de tentatives. Bloqué jusqu'à ${blockedUntil.toLocaleTimeString('fr-FR')}`
    }
  }

  // Mettre à jour le compteur
  await supabase
    .from('rate_limits')
    .update({ attempts: newAttempts })
    .eq('id', existing.id)

  return {
    allowed: true,
    remainingAttempts: config.maxAttempts - newAttempts,
    blockedUntil: null,
    message: 'OK'
  }
}

/**
 * Réinitialiser le rate limit après une action réussie (optionnel)
 */
export async function resetRateLimit(
  supabase: SupabaseClient,
  identifier: string,
  actionType: string
): Promise<void> {
  const anonIdentifier = await anonymizeIdentifier(identifier)
  await supabase
    .from('rate_limits')
    .delete()
    .eq('identifier', anonIdentifier)
    .eq('action_type', actionType)
}

/**
 * Nettoyer les vieilles entrées de rate limit (plus de 24h)
 * À appeler périodiquement ou à chaque requête (1% de chance)
 */
export async function cleanupOldRateLimits(supabase: SupabaseClient): Promise<number> {
  const oneDayAgo = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString()

  const { data, error } = await supabase
    .from('rate_limits')
    .delete()
    .or(`first_attempt_at.lt.${oneDayAgo},blocked_until.lt.${new Date().toISOString()}`)
    .select('id')

  if (error) {
    console.error('Cleanup error:', error)
    return 0
  }

  return data?.length || 0
}

/**
 * Vérification avec nettoyage automatique (1% de chance par requête)
 */
export async function checkRateLimitWithCleanup(
  supabase: SupabaseClient,
  identifier: string,
  actionType: string,
  config?: RateLimitConfig
): Promise<RateLimitResult> {
  // 1% de chance de nettoyer les vieilles entrées
  if (Math.random() < 0.01) {
    cleanupOldRateLimits(supabase).catch(console.error)
  }

  const finalConfig = config || DEFAULT_CONFIGS[actionType] || {
    maxAttempts: 50,
    windowMinutes: 15,
    blockMinutes: 15
  }

  return checkRateLimit(supabase, identifier, actionType, finalConfig)
}

/**
 * Obtenir l'IP du client depuis les headers
 */
export function getClientIP(req: Request): string {
  return req.headers.get('x-forwarded-for')?.split(',')[0]?.trim() ||
         req.headers.get('x-real-ip') ||
         req.headers.get('cf-connecting-ip') ||
         'unknown'
}
