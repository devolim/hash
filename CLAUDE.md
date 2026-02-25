# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Hash is an ultra-secure messaging application with zero compromise on privacy. The Flutter app is in `hash/`, backend configuration in `supabase/`.

**Core Principles:**
- Total anonymity (no phone/email required)
- Zero trace (messages deleted after delivery confirmation)
- End-to-end encryption (Signal Protocol)
- One device = one account (no recovery by design)

**Tech Stack:**
- Flutter/Dart with Riverpod state management
- Supabase (PostgreSQL v17, Auth, Realtime, Edge Functions)
- Signal Protocol for E2E encryption (libsignal_protocol_dart)
- Hive for secure local storage

## Common Commands

All Flutter commands from `hash/` directory:

```bash
flutter pub get           # Install dependencies
flutter run               # Run development
flutter analyze           # Lint code
flutter build apk         # Android APK
flutter build ios         # iOS build
```

Supabase commands from repo root:
```bash
supabase start            # Start local Supabase
supabase db push          # Apply migrations
supabase stop             # Stop local Supabase
```

## Architecture

### Flutter App (`hash/lib/`)

```
lib/
├── config/               # Supabase configuration
├── core/
│   ├── constants/        # App constants
│   ├── router/           # GoRouter configuration
│   ├── services/         # Auth, storage services
│   └── theme/            # Colors, typography, theme
├── data/
│   ├── datasources/      # Local and remote data sources
│   └── repositories/     # User, message repositories
├── domain/
│   └── models/           # User, Contact, Message, AppSettings
└── presentation/
    ├── providers/        # Riverpod providers
    ├── screens/          # All app screens
    └── widgets/          # Reusable widgets
```

### Database Security Model

**Critical:** Users cannot write directly to the database. All mutations go through PostgreSQL security definer functions:

- `register_user()` - Create new account with Signal Protocol keys
- `generate_temporary_code()` - 5-minute code for contact exchange
- `add_contact_request()` - Add contact with rate limiting
- `send_message()` - Send encrypted message
- `acknowledge_message()` - Confirm receipt (triggers server deletion)
- `delete_account()` - Panic button

RLS policies allow only SELECT on own data; all INSERT/UPDATE/DELETE must use functions.

### Key Security Features

- **PIN + Biometric auth** - Local app protection
- **Duress PIN** - Entering this PIN deletes all data silently
- **Panic button** - Instant data wipe
- **Screenshot protection** - FLAG_SECURE on Android
- **Message expiration** - 24h max on server, deleted after delivery

## Design System

Dark theme (default):
- Background: `#0A0A0A`
- Surface: `#1A1A1A`
- Accent: `#FFAB00` (amber)
- Success: `#00D26A`
- Error: `#FF4757`

## Configuration

Supabase config in `lib/config/supabase_config.dart`:
- URL: `https://hash.devolim.fr`
- Uses publishable key for client

## TODO / Future Work

- Implement full Signal Protocol key exchange
- LiveKit integration for audio/video calls
- R2 Cloudflare for media storage
- Firebase/APNs push notifications
- Multi-language support (i18n)
