import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { validateSessionStrict } from "../_shared/session-validator.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

/**
 * Register a contact verification token.
 *
 * After key exchange (QR code or contact request acceptance), both parties
 * compute a shared secret using Diffie-Hellman. From this secret, they derive:
 *
 * verification_token = HKDF(DH_shared_secret, "contact_verification", context)
 *
 * This token proves the relationship without revealing identities.
 * The server stores:
 * - verification_token (proves contact relationship)
 * - contact_mailbox_token (where to send messages to this contact)
 * - contact_relay_token (where to send push notifications)
 *
 * The server CANNOT:
 * - Know who the contact is
 * - Link this to any user identity
 * - Read any messages between them
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
    const {
      verification_token,       // HKDF(shared_secret, "contact_verification")
      contact_mailbox_token,    // Recipient's anonymous mailbox token
      contact_relay_token       // Optional: Recipient's notification relay token
    } = body

    // Validation
    if (!verification_token || typeof verification_token !== 'string' || verification_token.length !== 64) {
      return new Response(
        JSON.stringify({ error: 'verification_token invalide (64 caractères hex attendus)' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (!contact_mailbox_token || typeof contact_mailbox_token !== 'string' || contact_mailbox_token.length !== 64) {
      return new Response(
        JSON.stringify({ error: 'contact_mailbox_token invalide' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    if (contact_relay_token && (typeof contact_relay_token !== 'string' || contact_relay_token.length !== 64)) {
      return new Response(
        JSON.stringify({ error: 'contact_relay_token invalide' }),
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

    // Check if this contact already exists
    const { data: existingContact } = await supabaseAdmin
      .from('contact_tokens')
      .select('id')
      .eq('owner_user_id', userId)
      .eq('verification_token', verification_token)
      .single()

    if (existingContact) {
      // Update existing contact with new mailbox/relay tokens
      const { error: updateError } = await supabaseAdmin
        .from('contact_tokens')
        .update({
          contact_mailbox_token,
          contact_relay_token: contact_relay_token || null,
          is_active: true
        })
        .eq('id', existingContact.id)

      if (updateError) {
        console.error('[REGISTER-CONTACT-TOKEN] Update error:', updateError)
        return new Response(
          JSON.stringify({ error: 'Erreur lors de la mise à jour' }),
          { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
      }

      console.log('[REGISTER-CONTACT-TOKEN] token contact mis à jour')

      return new Response(
        JSON.stringify({
          success: true,
          updated: true
        }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Create new contact token
    const { data: newContact, error: insertError } = await supabaseAdmin
      .from('contact_tokens')
      .insert({
        owner_user_id: userId,
        verification_token,
        contact_mailbox_token,
        contact_relay_token: contact_relay_token || null,
        is_active: true
      })
      .select('id')
      .single()

    if (insertError) {
      console.error('[REGISTER-CONTACT-TOKEN] Insert error:', insertError)

      // Check for unique constraint violation
      if (insertError.code === '23505') {
        return new Response(
          JSON.stringify({ error: 'Contact déjà enregistré' }),
          { status: 409, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
      }

      return new Response(
        JSON.stringify({ error: 'Erreur lors de l\'enregistrement' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log('[REGISTER-CONTACT-TOKEN] token contact créé')

    return new Response(
      JSON.stringify({
        success: true,
        created: true,
        contact_id: newContact.id
      }),
      { status: 201, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error) {
    console.error('[REGISTER-CONTACT-TOKEN] Unexpected error:', error)
    return new Response(
      JSON.stringify({ error: 'Erreur serveur interne' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})
