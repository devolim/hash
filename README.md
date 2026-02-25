<p align="center">
  <img src="website/assets/images/hash_logo_text_white.png" alt="Hash" width="200">
</p>

<p align="center">
  <b>Ultra-secure messaging with zero compromise on privacy.</b>
</p>

<p align="center">
  <a href="https://hash.devolim.fr">Website</a> •
  <a href="https://hash.devolim.fr/en/security.html">Security</a> •
  <a href="https://hash.devolim.fr/en/privacy.html">Privacy Policy</a> •
  <a href="https://hash.devolim.fr/en/opensource.html">Open Source</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-iOS%20%7C%20Android-blue?style=flat-square" alt="Platform">
  <img src="https://img.shields.io/badge/Flutter-3.29-02569B?style=flat-square&logo=flutter" alt="Flutter">
  <img src="https://img.shields.io/badge/Encryption-Signal%20Protocol-green?style=flat-square&logo=signal" alt="Signal Protocol">
  <img src="https://img.shields.io/badge/License-AGPL%20v3-orange?style=flat-square" alt="License">
</p>

---

## What is Hash?

Hash is a messaging app built for people who take privacy seriously. No phone number, no email, no personal data required — just install and start messaging.

Every message is end-to-end encrypted using the **Signal Protocol** (Double Ratchet), wrapped in a **Sealed Sender** envelope so even the server doesn't know who's talking to whom. Messages are deleted from the server the moment they're delivered.

<p align="center">
  <img src="website/assets/images/screen_home.webp" width="180">&nbsp;&nbsp;
  <img src="website/assets/images/screen_chat_1.webp" width="180">&nbsp;&nbsp;
  <img src="website/assets/images/screen_security.webp" width="180">&nbsp;&nbsp;
  <img src="website/assets/images/screen_call_1.webp" width="180">
</p>

## Core Principles

- **Total Anonymity** — No phone number, no email. One device = one account.
- **Zero Trace** — Messages are deleted from the server after delivery confirmation. 24h max retention.
- **End-to-End Encryption** — Signal Protocol (Double Ratchet) + Sealed Sender for metadata protection.
- **No Recovery by Design** — If you lose your device, your data is gone. That's a feature.
- **Panic Mode** — Instantly wipe all data with a duress PIN or panic button.

## Features

### Messaging
- Text, images, videos, voice messages, files, contacts & location sharing
- Ephemeral messages with configurable timers
- View-once media
- Message reactions, replies & editing
- Delete for everyone
- Typing indicators
- Read receipts

### Calls
- Encrypted voice & video calls via LiveKit
- P2P when possible, relay when needed
- E2E encryption derived from Signal Protocol identity keys

### Security
- PIN + Biometric authentication
- Duress PIN (enters a fake empty state or wipes data)
- Configurable max PIN attempts (lock or destroy)
- Screenshot protection (FLAG_SECURE)
- Shake-to-lock
- BIP-39 recovery phrase
- Security number verification (QR code)

### Privacy
- Sealed Sender (server can't see sender identity)
- Message padding to hide content length
- Anti-replay counters
- Certificate pinning
- No analytics, no trackers, no ads

### Notes
- Encrypted personal notes with rich text editor
- Optional password protection per note

### Customization
- 13 alternate app icons
- 14 notification sounds
- Dark theme (default)
- 60+ languages

## Architecture

```
├── hash/                    # Flutter app (iOS & Android)
│   ├── lib/
│   │   ├── config/          # Environment-based configuration
│   │   ├── core/
│   │   │   ├── network/     # Certificate pinning
│   │   │   ├── services/    # Business logic (Signal, crypto, calls...)
│   │   │   └── theme/       # Design system
│   │   ├── data/            # Repositories
│   │   ├── domain/          # Models (Hive for local storage)
│   │   └── presentation/    # Screens, widgets, providers (Riverpod)
│   └── assets/              # Icons, sounds, fonts
│
├── supabase/                # Backend
│   ├── config.toml          # Supabase project configuration
│   ├── migrations/          # PostgreSQL schema & RLS policies
│   └── functions/           # Edge Functions (Deno/TypeScript)
│       ├── _shared/         # Auth validation & rate limiting
│       ├── send-sealed-message/
│       ├── register-user/
│       └── ...              # 35+ Edge Functions
│
└── website/                 # Public website (30+ languages)
```

### Security Model

Users **cannot write directly** to the database. All mutations go through PostgreSQL security-definer functions and Edge Functions with:
- Custom session validation (not Supabase JWT)
- Per-endpoint rate limiting
- RLS policies (SELECT only on own data)

### Encryption Layers

```
Plaintext
  → Signal Protocol (Double Ratchet encryption)
    → Sealed Sender (XEdDSA signature + AES-GCM envelope)
      → TLS (transport)
        → Server (can't read anything)
```

## Tech Stack

| Layer | Technology |
|-------|-----------|
| **App** | Flutter / Dart |
| **State** | Riverpod |
| **Local Storage** | Hive (encrypted) |
| **Backend** | Supabase (PostgreSQL 17, Auth, Realtime, Edge Functions) |
| **Encryption** | libsignal_protocol_dart (Signal Protocol / Double Ratchet) |
| **Calls** | LiveKit (WebRTC) |
| **Maps** | Mapbox + flutter_map |

## Getting Started

### Prerequisites

- Flutter 3.29+
- A Supabase project
- A Mapbox account (for map tiles)
- A LiveKit server (for calls)
- Firebase project (for push notifications)

### 1. Clone the repository

```bash
git clone https://github.com/devolim/hash.git
cd hash
```

### 2. Configure environment

```bash
cp hash/.env.example hash/.env
cp supabase/.env.example supabase/.env
cp supabase/functions/.env.example supabase/functions/.env
```

Edit each `.env` file with your own credentials.

### 3. Set up Supabase

```bash
supabase start
supabase db push
```

### 4. Run the app

```bash
cd hash
flutter pub get
flutter run --dart-define-from-file=.env
```

### 5. Firebase setup

Place your Firebase config files (not included for security):
- `hash/android/app/google-services.json`
- `hash/ios/GoogleService-Info.plist`

## Contributing

Contributions are welcome! Whether it's bug fixes, new features, translations, or security audits — every contribution matters.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Security Issues

If you discover a security vulnerability, please report it responsibly to **hash-security@devolim.fr**. Do not open a public issue.

## License

This project is licensed under the **GNU Affero General Public License v3.0** — see the [LICENSE](LICENSE) file for details.

## Support

- Email: hash-support@devolim.fr
- Abuse: hash-abuse@devolim.fr

---

<p align="center">
  <b>Your messages. Your privacy. No compromise.</b>
</p>
