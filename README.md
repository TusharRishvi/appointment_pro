# AppointmentPro

AppointmentPro is planned as a multi-business appointment booking and business management application for business owners, staff, and customers. The current repository is an early Flutter application foundation; the appointment and business features described here are roadmap items, not implemented functionality.

## Project Overview

The goal is to support multiple businesses and their customers in one application. Business owners will manage their business, services, locations, and staff; staff will manage their availability and appointments; customers will discover businesses and manage their bookings.

## Project Goals

- Build a production-quality, scalable, maintainable Flutter application.
- Treat Android phones as the primary target: prioritize mobile UI, navigation, responsiveness, usability, performance, and Android build validation.
- Support a verified release APK and Android App Bundle (AAB) before Android production release.
- Keep iOS and Web extensible for later phases without prioritizing them during initial development.
- Keep presentation, application state, business logic, and data access separate.
- Support multiple businesses and role-based access.
- Enforce authorization and booking-conflict prevention at trusted backend boundaries, not only in the client.
- Preserve the complete feature roadmap while delivering it in reviewed phases.

## User Roles

These are planned application roles; role management and authorization are not implemented.

| Role | Intended responsibilities |
| --- | --- |
| Admin / Business Owner | Register and manage a business, locations, services, prices, working hours, staff, appointments, reports, and settings. |
| Staff | Manage their profile and availability and view or manage appointments they are authorized to handle. |
| Customer | Discover businesses and services, book and manage appointments, maintain a profile and booking history, and submit reviews. |

## Feature Roadmap

All items below are **Planned** unless explicitly marked otherwise in [Current Status](#current-status).

- Authentication and role-aware access.
- Business registration, profiles, and multiple locations.
- Services, pricing, duration, and working hours.
- Staff profiles, availability, and scheduling.
- Appointment booking with reliable, backend-enforced double-booking prevention.
- Booking confirmation, cancellation, and rescheduling.
- Customer profiles and booking history.
- Push, email, and SMS notification options.
- Calendar views, revenue analytics, and reports.
- Customer reviews and ratings.

## Technology Stack

### Confirmed in the current project

- **Flutter / Dart:** Flutter application; the SDK constraint in `pubspec.yaml` is Dart `^3.12.2`.
- **Product platform priority:** Android mobile is the approved primary target. The current Flutter project also includes iOS, Web, and desktop runner folders, but their existence does not make them initial priorities.
- **Firebase Flutter packages:** `firebase_core`, `firebase_auth`, `cloud_firestore`, and `firebase_messaging` are dependencies.
- **Flutter testing and linting:** `flutter_test` and `flutter_lints`.
- **Firebase project:** The generated client configuration targets `appointmentpro-34ee7`.
- **Configured client platforms:** Android, iOS, and Web have Firebase app registrations and generated Dart options.
- **Android delivery goal:** A release APK and AAB are required eventually; release signing, APK/AAB builds, and Play publishing are not configured or verified.

### Not selected or not implemented

- **State management:** No package or approach is selected in the codebase.
- **Routing:** No routing package or route structure is present.
- **Dependency injection:** No separate dependency-injection package or composition layer is present.
- **Earlier architecture proposal:** Riverpod for state/dependency management and `go_router` for routing were proposed, but remain unapproved and are not dependencies.
- **Server-side functions:** No Cloud Functions or other backend function implementation is present. Any future choice requires separate cost, availability, and safe-alternative review.

## Complete Folder Structure

This tree documents the current meaningful project structure; Flutter platform folders contain additional generated runner, build, and asset files. Generated build/cache data such as `.dart_tool/` and `build/`, plus machine-specific metadata, are omitted.

```text
.
├── .claude/
│   └── rules/
│       └── intructions.instructions.md
├── .github/
│   └── copilot-instructions.md
├── .idea/
│   ├── libraries/
│   └── runConfigurations/
├── .vscode/
│   └── settings.json
├── android/
│   └── app/
│       ├── build.gradle.kts
│       └── google-services.json
├── docs/
│   ├── AI_HANDOFF.md
│   ├── ARCHITECTURE.md
│   └── PROJECT_STATUS.md
├── ios/
│   ├── Runner.xcodeproj/
│   ├── Runner.xcworkspace/
│   └── Runner/
│       └── Assets.xcassets/
├── lib/
│   ├── firebase_options.dart
│   └── main.dart
├── linux/
│   ├── flutter/
│   └── runner/
├── macos/
│   ├── Flutter/
│   └── Runner/
├── test/
│   └── widget_test.dart
├── web/
│   ├── icons/
│   ├── favicon.png
│   ├── index.html
│   └── manifest.json
├── windows/
│   ├── flutter/
│   └── runner/
├── AGENTS.md
├── CLAUDE.md
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── firebase.json
├── pubspec.lock
├── pubspec.yaml
└── README.md
```

### Folder and file responsibilities

- `lib/`: Application Dart source. It currently has only the Firebase options and app entry point; no feature-first directories or business screens exist yet.
- `lib/main.dart`: Initializes Flutter and Firebase, then runs the current minimal application shell.
- `lib/firebase_options.dart`: FlutterFire-generated client options for Android, iOS, and Web. Do not copy its API-key values into documentation or treat client configuration as authorization.
- `android/`, `ios/`, `web/`: Flutter platform runners and platform-specific configuration/assets. Android has `android/app/google-services.json`; an iOS `ios/Runner/GoogleService-Info.plist` is not present.
- `linux/`, `macos/`, `windows/`: Flutter desktop runner projects. Firebase options and plugin support for these targets have not been configured or verified.
- `test/`: Widget tests. `test/widget_test.dart` currently contains the application-shell smoke test.
- `AGENTS.md`: Shared agent rules and project source of truth.
- `CLAUDE.md`, `.github/copilot-instructions.md`, `.claude/rules/intructions.instructions.md`: Short tool-specific entry points to shared project rules.
- `docs/ARCHITECTURE.md`: Current implementation, planned architecture, and unresolved decisions.
- `docs/PROJECT_STATUS.md`: Current phase, completed work, blockers, and exact next action.
- `docs/AI_HANDOFF.md`: Required cross-agent reading protocol and handoff log.
- `.vscode/settings.json`: Workspace-specific VS Code settings.
- `pubspec.yaml` / `pubspec.lock`: Package constraints and resolved Flutter/Dart dependencies.
- `analysis_options.yaml`: Dart analyzer and lint configuration.
- `firebase.json`: FlutterFire CLI platform/project mapping.
- `README.md`: Project overview, architecture notes, setup, and status.

The following application folders are **not present** yet: `app/`, `core/`, `data/`, `features/`, `assets/`, and `integration_test/`. The `docs/` folder now contains the shared architecture, status, and handoff records. The feature-first application layout remains a planned architecture decision to finalize before feature development.

## Architecture and Data Flow

### Current implementation

The current entry point initializes Firebase using generated platform options, then displays a minimal `MaterialApp` shell. No state-management, routing, repository, service, data-source, or feature layer is implemented.

### Planned flow

The following describes a future architecture, not current code:

```text
Screen / Widget
    ↓ user intent and displayed state
Feature controller or provider
    ↓ validation and application/business rules
Feature repository
    ↓ data contract
Remote/local data source
    ↓ authenticated and authorized operation
Firebase or other approved data service
    ↑ typed result or explicit error
Repository → controller/provider → UI state
```

When architecture is approved, feature-specific UI, state, models, business rules, and repository contracts should live together by feature where practical. Shared infrastructure and cross-feature implementations should be introduced only when needed. Firebase Security Rules and trusted backend logic must enforce access control and booking conflict prevention.

## Firebase Architecture

| Area | Intended use | Current status |
| --- | --- | --- |
| Firebase project | `appointmentpro-34ee7` | **Configured** in generated client configuration. |
| Firebase app registrations | Android, iOS, Web | **Registered**; selected identifiers currently use template-style `com.example` names. |
| Firebase initialization | Initialize the SDK when the app starts | **Implemented** in `lib/main.dart`; Web startup was exercised without Dart runtime errors. |
| Firebase Authentication | Accounts and identity | **Package added; feature and provider setup not implemented or verified.** |
| Cloud Firestore | Online application data | **Package added; not ready for use.** A database has not been created, and the Firestore API was reported disabled. Database region and activation remain undecided. |
| Firebase Security Rules | Enforce user/business authorization | **Not present or deployed.** Do not store production data until reviewed rules exist. |
| Firebase Cloud Messaging | Push notification delivery | **Package added; delivery setup not implemented or verified.** Platform-specific credentials and notification handling remain pending. |
| Email and SMS reminders | Customer reminders | **Planned.** No delivery provider or implementation selected. |
| Cloud Functions | Trusted server-side work, if needed | **Not implemented or selected.** Review pricing, availability, and safe alternatives first. |

No billing change is documented as part of this setup. Firebase configuration does not by itself prove that a Firebase service is enabled, secured, or operational.

## Environment Setup

### Prerequisites

- Flutter with Dart `^3.12.2` support.
- Git.
- A network connection to retrieve packages.
- For Firebase app reconfiguration: Firebase CLI authentication and FlutterFire CLI.
- For Android development: Android SDK and accepted Android SDK licenses.
- For iOS development/builds: macOS and Xcode; these are not available in the current Windows environment.

### Commands

Run these commands from the repository root:

```powershell
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
```

To reconfigure Firebase client options after confirming the project and app identifiers:

```powershell
flutterfire configure --project=appointmentpro-34ee7 --platforms=android,ios,web --android-package-name=com.example.appointment_pro --ios-bundle-id=com.example.appointmentPro --out=lib/firebase_options.dart
```

FlutterFire may update platform configuration and register Firebase apps. Review its output and resulting diff before accepting additional changes. This command does not create Firestore security rules or configure authentication providers, notification credentials, or database authorization.

Useful environment checks:

```powershell
flutter --version
dart --version
flutter doctor -v
```

For Firebase CLI and FlutterFire CLI setup on a development machine:

```powershell
npm install -g firebase-tools
dart pub global activate flutterfire_cli
firebase login
firebase projects:list
```

Confirm the intended project and app identifiers before running FlutterFire configuration. Do not select or create a different Firebase project as a fallback.

Do not add private keys, service-account credentials, passwords, or access tokens to the Flutter client or this README.

## Coding Standards

- Use Flutter/Dart conventions, null safety, and clear, domain-appropriate names.
- Keep presentation, application/business logic, and data access separated.
- Prefer feature-first organization once approved; avoid empty placeholder files and premature abstractions.
- Reuse shared logic only where the behavior is genuinely shared.
- Validate inputs and explicitly handle loading, empty, and error states.
- Enforce authorization in Firebase Security Rules and trusted backend logic, not only in UI.
- Keep booking conflict prevention reliable and backend-enforced.
- Keep this README synchronized with approved implementation and architecture changes.

## Mandatory No-Comments Rule

Do not add source-code comments, documentation comments, TODO/FIXME comments, or commented-out code. Explain code behavior with meaningful names and maintain project-level explanation in external documentation such as this README. Existing generated or template files may contain comments; do not introduce new ones while changing code.

## Quality Assurance

After Dart code changes:

1. Run `flutter analyze` from the project root.
2. Resolve issues introduced by the change and rerun analysis until it reports `No issues found!`, where safely achievable.
3. Run relevant unit, widget, or integration tests.
4. Report only checks that were actually executed and their real results.

For dependency changes, run `flutter pub get`. Analysis alone does not prove runtime, Firebase service, security-rule, or end-to-end behavior.

## Git and Repository Rules

- Preserve existing local work, untracked files, and the GitHub README.
- Do not reset, delete, overwrite, or pull over local work without reviewing the risk and getting approval.
- Do not stage, commit, push, or change repository history without explicit approval.
- The configured remote is `origin` at `https://github.com/TusharRishvi/appointment_pro.git`; the current branch is `main`.
- In the inspected local checkout, `README.md` is tracked, while the Flutter project files and local instructions are untracked. Review Git status before any repository operation.
- Before adding source to version control, review the exact file list and ignore rules, retain the local README change, and exclude machine-specific files, generated caches/build output, and privileged credentials. Stage only an explicitly reviewed list after user approval; do not stage or commit as part of setup.
- Root and platform ignore rules cover Flutter build/cache output, Android local properties/keystores, and generated iOS files. A general `.env` or service-account filename exclusion is not present; inspect any future credential files and add narrow ignore rules before introducing them.

## AI Continuity

Shared rules live in `AGENTS.md`; `CLAUDE.md` and `.github/copilot-instructions.md` are short tool entry points. Every agent must manually read `AGENTS.md`, this README, and `docs/ARCHITECTURE.md`, `docs/PROJECT_STATUS.md`, and `docs/AI_HANDOFF.md`, then read its tool-specific entry file. Tool auto-discovery and cross-agent synchronization are not verified; see `docs/AI_HANDOFF.md`.

## Development Phases

1. **Project structure — Planned:** Flutter starter exists; a production feature-first source layout has not yet been created or finalized.
2. **Foundation and configuration — In Progress:** Firebase client SDK dependencies, Android/iOS/Web app registrations, generated options, and startup initialization exist. Remaining service setup is listed below.
3. **Authentication — Planned:** Define account flows, roles, and authorization; configure and test Firebase Authentication providers.
4. **Business management — Planned:** Business profiles, locations, services, prices, working hours, and staff availability.
5. **Booking engine — Planned:** Scheduling, booking lifecycle, and trusted backend double-booking prevention.
6. **Notifications — Planned:** Push and approved email/SMS reminder delivery with platform credentials and user preferences.
7. **Analytics and reporting — Planned:** Calendar, revenue summaries, analytics, and reports.
8. **Testing and security — Planned:** Rules, role boundaries, critical flows, regression tests, and failure handling.
9. **Release readiness — Planned:** Production identifiers, platform builds, privacy/security review, monitoring, and release process.

Each phase should be reviewed before work expands into the next.

## Current Status

### Completed

- Flutter multi-platform starter project is present.
- Firebase project `appointmentpro-34ee7` has Android, iOS, and Web app registrations.
- Firebase client packages and generated options are present.
- Firebase initialization is wired into the app entry point.
- A minimal application-shell widget test is present.

### Pending

- Finalize production Android and Apple bundle identifiers; current Firebase registrations use template-style identifiers.
- Decide whether and where to create a Firestore database, then enable/configure the service with reviewed security rules.
- Configure and verify Authentication providers.
- Configure and verify push delivery credentials and platform handling; decide reminder providers for email/SMS.
- Decide and approve state management, routing, dependency injection, feature structure, and data model.
- Accept Android SDK licenses before Android toolchain validation.
- Verify iOS configuration/build on macOS with Xcode.
- Build feature and integration tests as functionality is implemented.

### Known limitations

- The visible application is a blank shell, not a working appointment product.
- No business features, navigation, state-management layer, repository/data-source layer, Firestore data, or Firebase rules are implemented.
- `GoogleService-Info.plist` is absent; iOS build/runtime configuration has not been verified.
- Firebase options for macOS, Windows, and Linux are not generated.
- Web Firebase initialization was launched and produced no Dart runtime errors, but authentication, Firestore, and messaging operations were not exercised.

### Next planned phase

Review the application foundation and decide the remaining architecture and Firebase service configuration before implementing authentication or appointment features.

## Important Decisions and Limitations

- **Confirmed:** Flutter/Dart application; Firebase client packages for Core, Authentication, Firestore, and Messaging; Firebase project `appointmentpro-34ee7`; Firebase client targets Android, iOS, and Web.
- **Not confirmed:** Riverpod, `go_router`, a separate dependency-injection package, database schema, Firestore region, Authentication providers, notification delivery vendors, and server-side function approach.
- **Security:** Firebase client options are not privileged server credentials. Client configuration is not authorization. Never expose service-account private keys, and do not deploy permissive rules.
- **Cost:** Firebase pricing depends on services, usage, and project configuration. Do not enable billing or create chargeable resources without explicit approval.
- **Platform limits:** Firebase app registration does not mean every Firebase plugin supports every Flutter desktop target. Verify plugin support and required configuration before promising desktop Firebase functionality.
- **Android release readiness:** The current Android app ID is still `com.example.appointment_pro`, SDK license acceptance is pending, and no release signing, APK, or AAB has been verified.

## Flutter Learning Resources

- [Flutter documentation](https://docs.flutter.dev/)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter reference](https://docs.flutter.dev/reference/learning-resources)
