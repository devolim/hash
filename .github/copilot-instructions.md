<!-- .github/copilot-instructions.md - guidance for AI coding agents -->
# Quick Agent Guide for the Hash repo

This file gives concise, actionable guidance to AI coding agents working on this repository. Focus on concrete, discoverable patterns and commands that make you productive immediately.

1) Big picture
- App: `hash/` — Flutter app (Dart + Riverpod). Primary entry: `hash/lib/main.dart`.
- Backend: `supabase/` — Postgres (v17) with Row-Level Security (RLS), SQL functions, and Edge Functions in `supabase/functions/`.
- Data flow: Client reads are usually direct SELECTs (RLS-limited). All mutations (INSERT/UPDATE/DELETE) go through server-side SQL functions (security-definer) or Edge Functions.

2) Critical developer workflows (exact commands)
- Flutter (run from the `hash/` directory):
  ```bash
  cd hash
  flutter pub get
  flutter run        # debug on connected device or simulator
  flutter analyze
  flutter test
  flutter build apk
  flutter build ios
  ```
- Supabase local workflow (repo root):
  ```bash
  supabase start
  supabase db push    # apply migrations in `supabase/migrations/`
  supabase stop
  ```
- When changing database schema or security logic, update SQL in `supabase/migrations/` (e.g. `20260122_zero_knowledge_architecture.sql`) and run `supabase db push`.

3) Project-specific conventions and patterns
- Security-first design: most server-side changes are expressed as Postgres functions (e.g. `register_user()`, `send_message()`, `acknowledge_message()`). Do not add client-side DB writes that bypass these functions.
- RLS + security-definer functions: RLS policies allow only SELECT on per-user data; any INSERT/UPDATE/DELETE must be performed via explicit functions. Look for SQL function names in `supabase/migrations/` and `supabase/functions/`.
- Folder layout to key into when editing code:
  - `hash/lib/config/` — Supabase configuration (check `supabase_config.dart` for URLs/keys)
  - `hash/lib/core/services/` — Auth, storage and other platform services
  - `hash/lib/data/datasources/` and `hash/lib/data/repositories/` — where remote/local I/O is implemented
  - `hash/lib/presentation/providers/` — Riverpod providers; use provider patterns for state
  - `supabase/functions/` — Edge functions used by the app; changes here may require local function build/deploy

4) Security- and UX-sensitive behaviors to preserve
- Duress PIN / panic features: the codebase includes silent data wipe behaviors. Avoid refactors that change lifecycle or unlock flows without regression tests.
- Message lifecycle: messages are deleted after delivery confirmation — the server-side `acknowledge_message()` flow must remain intact.
- Local storage: Hive is used for local secure storage. Keep migrations / schema changes consistent with Hive usage in `lib/core/services`.

5) Integration points & deployment hints
- Production Supabase URL and keys live in `lib/config/supabase_config.dart` (client-facing values). For local development, use `supabase start` and the local connection.
- Edge functions live in `supabase/functions/` (one folder per function). Deploy with `supabase functions deploy` when ready.

6) Concrete examples agents should use when making edits
- If you add a new API surface that mutates user data:
  - Add a Postgres function in `supabase/migrations/`
  - Update RLS policies accordingly
  - Run `supabase db push` and update any related Edge Function in `supabase/functions/`
  - Update the Flutter repository layer in `hash/lib/data/repositories/` and the provider in `hash/lib/presentation/providers/`

7) Files & directories to inspect first (quick navigation)
- `CLAUDE.md` — human-facing project overview (contains many details usable by agents)
- `supabase/migrations/` — DB schema, functions and RLS
- `supabase/functions/` — server-side Edge Functions
- `hash/lib/config/supabase_config.dart` — connection info
- `hash/lib/` — core Flutter app (services, repositories, providers)

8) What not to change without human review
- Altering Postgres security-definer functions or RLS policies (high risk)
- Changing authentication flows, duress/panic logic, or message deletion logic

If anything in this document seems incomplete or inconsistent, tell me which area you want expanded (database, edge functions, Flutter layers, or local dev). Ready to iterate on specific sections.
