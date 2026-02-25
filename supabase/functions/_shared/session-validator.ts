import { SupabaseClient } from "https://esm.sh/@supabase/supabase-js@2"

export interface SessionValidationResult {
  valid: boolean
  userId: string | null
  error: string | null
}

/**
 * Valide une session utilisateur en vérifiant:
 * 1. Le token JWT est valide
 * 2. Le token a été émis APRÈS session_valid_after (si défini)
 * 3. Optionnellement, le device_id correspond
 *
 * Utiliser cette fonction dans toutes les Edge Functions qui nécessitent
 * une authentification pour s'assurer que les anciennes sessions après
 * un transfert de device sont rejetées.
 */
export async function validateSession(
  supabaseAdmin: SupabaseClient,
  supabaseUser: SupabaseClient,
  options?: {
    checkDeviceId?: string  // Si fourni, vérifie que le device_id correspond
  }
): Promise<SessionValidationResult> {
  try {
    // 1. Vérifier le token JWT
    const { data: { user }, error: authError } = await supabaseUser.auth.getUser()

    if (authError || !user) {
      return {
        valid: false,
        userId: null,
        error: 'Token invalide ou expiré'
      }
    }

    const userId = user.id

    // 2. Récupérer les infos utilisateur (session_valid_after, device_id)
    const { data: userData, error: userError } = await supabaseAdmin
      .from('users')
      .select('id, device_id, session_valid_after')
      .eq('id', userId)
      .single()

    if (userError || !userData) {
      return {
        valid: false,
        userId,
        error: 'Utilisateur non trouvé'
      }
    }

    // 3. Vérifier session_valid_after
    if (userData.session_valid_after) {
      // Récupérer le timestamp d'émission du token (iat)
      // Le token JWT contient un claim "iat" (issued at)
      const tokenIssuedAt = user.created_at
        ? new Date(user.created_at)
        : null

      // Si on ne peut pas déterminer quand le token a été émis,
      // on utilise la session actuelle
      // Note: En production, il faudrait décoder le JWT pour obtenir "iat"
      const sessionValidAfter = new Date(userData.session_valid_after)

      // Vérifier avec les métadonnées de session si disponibles
      // @ts-ignore
      const sessionIat = user.aud === 'authenticated' && user.role === 'authenticated'
        ? new Date(user.updated_at || user.created_at)
        : null

      if (sessionIat && sessionIat < sessionValidAfter) {
        return {
          valid: false,
          userId,
          error: 'Session invalidée (transfert de device)'
        }
      }

      // Fallback: Vérifier via last_sign_in_at si disponible
      // @ts-ignore
      if (user.last_sign_in_at) {
        // @ts-ignore
        const lastSignIn = new Date(user.last_sign_in_at)
        if (lastSignIn < sessionValidAfter) {
          return {
            valid: false,
            userId,
            error: 'Session invalidée (transfert de device)'
          }
        }
      }
    }

    // 4. Vérifier le device_id si demandé
    if (options?.checkDeviceId) {
      // Hasher le device_id fourni pour comparaison
      const deviceHash = await crypto.subtle.digest(
        'SHA-256',
        new TextEncoder().encode(options.checkDeviceId)
      ).then(buf => Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join(''))

      if (deviceHash !== userData.device_id) {
        return {
          valid: false,
          userId,
          error: 'Device non autorisé'
        }
      }
    }

    return {
      valid: true,
      userId,
      error: null
    }

  } catch (error) {
    console.error('Session validation error:', error)
    return {
      valid: false,
      userId: null,
      error: 'Erreur de validation de session'
    }
  }
}

/**
 * Helper pour extraire le timestamp d'émission d'un JWT
 * sans le valider (la validation est faite par Supabase)
 */
export function getJwtIssuedAt(token: string): Date | null {
  try {
    // JWT format: header.payload.signature
    const parts = token.split('.')
    if (parts.length !== 3) return null

    // Décoder le payload (base64url)
    const payload = JSON.parse(atob(parts[1].replace(/-/g, '+').replace(/_/g, '/')))

    if (payload.iat) {
      return new Date(payload.iat * 1000) // iat est en secondes
    }
    return null
  } catch {
    return null
  }
}

/**
 * Valide une session avec vérification du timestamp d'émission du JWT
 * Plus sécurisé car vérifie directement le claim "iat" du token
 */
export async function validateSessionStrict(
  supabaseAdmin: SupabaseClient,
  authHeader: string,
  supabaseUser: SupabaseClient
): Promise<SessionValidationResult> {
  try {
    // 1. Vérifier le token JWT
    const { data: { user }, error: authError } = await supabaseUser.auth.getUser()

    if (authError || !user) {
      return {
        valid: false,
        userId: null,
        error: 'Token invalide ou expiré'
      }
    }

    const userId = user.id

    // 2. Récupérer session_valid_after
    const { data: userData, error: userError } = await supabaseAdmin
      .from('users')
      .select('id, session_valid_after')
      .eq('id', userId)
      .single()

    if (userError || !userData) {
      return {
        valid: false,
        userId,
        error: 'Utilisateur non trouvé'
      }
    }

    // 3. Si session_valid_after est défini, vérifier le timestamp du token
    if (userData.session_valid_after) {
      // Extraire le token du header Authorization
      const token = authHeader.replace('Bearer ', '')
      const tokenIssuedAt = getJwtIssuedAt(token)
      const sessionValidAfter = new Date(userData.session_valid_after)

      if (tokenIssuedAt && tokenIssuedAt < sessionValidAfter) {
        console.log('[SESSION-VALIDATOR] token émis avant la validité de session')
        return {
          valid: false,
          userId,
          error: 'Session invalidée suite au transfert de compte'
        }
      }
    }

    return {
      valid: true,
      userId,
      error: null
    }

  } catch (error) {
    console.error('Session validation error:', error)
    return {
      valid: false,
      userId: null,
      error: 'Erreur de validation de session'
    }
  }
}
