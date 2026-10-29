# AppointmentPro Architecture

## Decision status

This document records verified implementation separately from proposed architecture. A proposal is not an approval. Update the decisions below when the user explicitly approves a choice.

## Approved product platform priority

- **Approved:** Android mobile is the primary target for initial development.
- Prioritize phone-sized UI, navigation, responsiveness, usability, performance, Android-specific Firebase integration, and Android build/test validation.
- The product must be capable of a release APK and Android App Bundle (AAB) before production release; these builds and signing are not currently verified.
- Keep iOS and Web extensible, but do not prioritize them during initial development.
- This target decision does not approve any particular UI architecture, app navigation package, state-management package, production Android application ID, or Firebase service activation.

## Current implementation

- Flutter/Dart application with `lib/main.dart` as the entry point.
- `main()` ensures Flutter bindings, initializes Firebase using `DefaultFirebaseOptions.currentPlatform`, and starts a minimal `MaterialApp`.
- `lib/firebase_options.dart` contains generated Firebase client options for Android, iOS, and Web.
- Firebase dependencies are present for Core, Authentication, Firestore, and Messaging.
- No feature screens, app routing, state-management layer, repository/data-source layer, role authorization, or appointment logic is implemented.
- `firebase.json` maps the Firebase project and configured client applications.
- The actual current folder tree is recorded in `README.md`; do not describe proposed folders there as implemented.

## Proposed feature-first organization

The following is a planning target, not a created or approved source tree:

```text
lib/
  app/
    config/
    router/
  core/
    constants/
    errors/
    services/
    theme/
    utils/
    widgets/
  data/
    datasources/
    models/
    repositories/
  features/
    auth/
    business/
    services/
    staff/
    booking/
    customers/
    notifications/
    calendar/
    analytics/
    reviews/
    settings/
```

Add a feature subfolder such as `models/`, `repositories/`, `services/`, `providers/`, `controllers/`, `screens/`, or `widgets/` only when it has a real responsibility. Avoid empty placeholder files and premature global abstractions. Prefer feature-owned models and repositories; put cross-feature implementations in `data/` only when their shared responsibility is established.

## Responsibilities

- `app/` (planned): Application composition, environment/flavor configuration, root router, and app-wide initialization.
- `core/` (planned): Stable cross-feature primitives such as shared errors, utilities, theme, constants, and reusable UI. Keep feature rules out of `core/`.
- `data/` (planned): Concrete local/remote data sources and shared repository implementations or DTOs where cross-feature ownership is justified.
- `features/<feature>/` (planned): Feature UI, state orchestration, domain rules, feature-owned models, and repository contracts.
- `test/` (present): Unit and widget tests. `integration_test/` is not present.
- `assets/` (not present): Add only when real image/font assets are introduced.
- `docs/` (present): Shared architecture, current status, and AI handoff records.
- `firebase.json` and generated client options: Firebase client configuration, not security rules or privileged credentials.

## State management, routing, and dependency injection

| Concern | Current state | Decision |
| --- | --- | --- |
| State management | No state-management package or pattern is present. | Open. Riverpod was previously proposed but is not approved. |
| Routing | No routing package or app route tree is present. | Open. `go_router` was previously proposed but is not approved. |
| Dependency injection | No separate DI package or composition layer is present. | Open. Choose alongside state and routing; avoid a separate package unless it brings clear value. |
| Model generation | No generator is installed. | Open; defer until model requirements justify a choice. |

Do not add packages or restructure `lib/` for these proposals without explicit approval.

## Android-first engineering and release

- Design screen layouts for Android phones first; account for small and large phone sizes, keyboard/insets, touch targets, accessibility, and responsive states.
- Keep presentation, state, business rules, and data access separated so later iOS/Web support does not leak platform assumptions into domain code.
- Prefer Android emulator/device widget and integration coverage for critical navigation, authentication, booking, and Firebase flows as those features are implemented.
- Verify Android Firebase configuration through an Android build and runtime check; Firebase app registration or generated configuration alone is not proof of working integration.
- Before release, review the final production `applicationId`, signing configuration, Android permissions, release build, APK installation, and AAB generation. Keep signing keys and credentials outside source control.
- None of the production identifiers, signing setup, release APK, or AAB are currently finalized or verified.

## Planned request and data flow

```text
Screen / widget
    ↓ user intent
Feature controller or provider (pattern to be approved)
    ↓ validate input and apply business rules
Feature repository contract
    ↓
Data source / Firebase adapter
    ↓ authenticated request
Firebase Security Rules and, where required, trusted server logic
    ↑ typed result or explicit failure
Repository → feature state → screen
```

This is a conceptual future flow only. No layer shown here beyond the startup shell is implemented.

## Firebase boundaries and security

- Firebase client packages: Core, Authentication, Firestore, and Messaging.
- Configured Firebase project: `appointmentpro-34ee7`; generated client options exist for Android, iOS, and Web.
- Authentication providers have not been selected or verified.
- Firestore API was reported disabled, no database/region has been confirmed, and no Firestore rules exist.
- Messaging delivery credentials, token lifecycle, notification permissions, and foreground/background behavior are not configured or verified.
- `GoogleService-Info.plist` is absent. Desktop Firebase options are not generated.
- Client configuration is not authorization. Never put service-account keys or privileged credentials in the client.
- Role and business access must be enforced in reviewed Firebase Security Rules and trusted backend logic.
- Booking conflict prevention must be atomic/backend-enforced; client-side availability checks alone are insufficient.
- Cloud Functions remain undecided. Compare pricing, availability, and safe alternatives before proposing them. Never enable billing without explicit approval.

## Open architecture decisions

1. Final Android/iOS production identifiers; current Firebase app registrations use template-style identifiers.
2. Whether and where to create Firestore, and the database/data model.
3. Authentication methods and role assignment/authorization model.
4. State management, routing, and dependency-injection approach.
5. Trusted booking-conflict prevention design, including service cost and platform constraints.
6. Push, email, and SMS providers and required credentials.
7. Supported production platforms and Firebase plugin support per platform.

Record approved decisions here and in `docs/PROJECT_STATUS.md`. Keep the README implementation status synchronized.
