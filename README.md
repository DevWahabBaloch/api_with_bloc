# API with BLoC: Multi-Role Sign-Up Flow

Multi-step REST authentication flow in Flutter: role-based sign-up, email OTP verification and password setup with Cubit and auto_route.

## Overview

A complete sign-up journey backed by a REST API. Separate registration flows for caregivers and seniors lead to email verification with a one-time code and then password setup. Each step has its own Cubit.

## Features

- Role-based registration (**caregiver** and **senior**)
- Email verification with a PIN/OTP input (`pinput`)
- Set-password step that completes the account
- One Cubit per feature with typed states, provided app-wide via `MultiBlocProvider`
- Type-safe, generated routing with **auto_route**
- Environment-based API configuration (`.env`), with the user's profile details persisted in SharedPreferences
- Reusable validation through a mixin and extension methods

## Tech stack

Flutter · Dart · flutter_bloc · auto_route · http · shared_preferences · pinput · flutter_dotenv

## Project structure

```text
lib/
├── config/env/              # environment loading
├── config/routes/           # auto_route router (generated *.gr.dart)
├── core/                    # constants, validators, MultiBlocProvider
└── features/auth/
    ├── caregiver_signup/    # domain/model · presentation/bloc · presentation/pages
    ├── senior_signup/
    ├── email_verify_page/
    └── set_password/
```

## Getting started

```bash
flutter pub get
cp .env.example .env   # then fill in the values
flutter run
```

The app loads its configuration from a `.env` file at the project root. That file isn't committed; see `.env.example` for the variables it needs.

---

Built by [Abdul Wahab](https://github.com/DevWahabBaloch), Senior Flutter Developer · [Portfolio](https://devwahabbaloch.web.app/)
