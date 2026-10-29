# AppointmentPro Shared Agent Instructions

This file is the shared source of truth for AI agents working in this repository. Tool-specific files should point here rather than maintain conflicting copies of project policy.

## Required reading before work

Before starting a task, read:

1. `AGENTS.md`
2. `README.md`
3. `docs/ARCHITECTURE.md`
4. `docs/PROJECT_STATUS.md`
5. `docs/AI_HANDOFF.md`
6. The applicable tool entry file from the instructions table in `docs/AI_HANDOFF.md`

Then inspect the current Git branch, `git status`, relevant diffs, and the files related to the task. Identify the current phase and next incomplete task from `docs/PROJECT_STATUS.md`. Do not repeat completed work without evidence that it needs changing.

## Project direction

AppointmentPro is a production-oriented Flutter multi-business appointment and business-management application for Admin/Business Owner, Staff, and Customer roles. Preserve the full scope recorded in `README.md`; label planned work as planned, never as implemented.

Android phones are the primary product target. Prioritize Android mobile UI, navigation, responsiveness, usability, performance, Android build validation, and an eventual release APK/AAB. Keep iOS and Web extensible for future work without prioritizing them in initial development.

The confirmed client stack is Flutter/Dart with Firebase Core, Authentication, Firestore, and Messaging packages. Firebase client configuration currently targets Android, iOS, and Web. Firebase service readiness, feature architecture, state management, routing, dependency injection, and data schema are not fully settled; use `docs/ARCHITECTURE.md` as the decision record and do not infer approval from a proposal. Android release signing, production application ID, and successful APK/AAB builds are not yet verified.

## Safe work and approvals

- Inspect existing project state before proposing or changing files. Preserve user work, untracked files, and README changes.
- Follow the specific task authorization. Ask for approval before project file edits, dependency installation, configuration changes, or consequential operations when that task has not already explicitly authorized them.
- Do not overwrite or discard local or remote work. Never use destructive reset/clean/restore operations, force-push, or history rewrites.
- Never stage, commit, push, pull, merge, or rebase without explicit user approval.
- Never enable billing or create chargeable resources without explicit permission.
- Do not claim GitHub, Firebase, an extension, MCP server, or automatic agent synchronization is configured unless it has been verified.

## Engineering and security

- Follow Flutter/Dart conventions, null safety, clear naming, and maintainable separation of UI, application/business logic, and data access.
- Trace the relevant flow and establish the root cause before changing code. Keep changes surgical and preserve intended behavior.
- Validate inputs and explicitly handle loading, empty, and error states. Do not silently swallow errors or add success-shaped fallbacks.
- Enforce authorization in Firebase Security Rules and trusted backend logic, not only in the UI.
- Appointment double-booking prevention must be enforced by a trusted backend, not only by client-side checks.
- Never expose passwords, tokens, service-account credentials, private keys, or other privileged secrets. Do not deploy permissive security rules.
- Before proposing Cloud Functions or paid services, review pricing, availability, and safe alternatives. Do not promise that all usage is free.

## No-comments rule

Do not add source-code comments, documentation comments, TODO/FIXME comments, or commented-out code. Use meaningful names and external project documentation. Avoid unrelated edits to existing generated/template comments.

## Validation and continuity

- After Dart code changes, run `flutter analyze`, resolve issues introduced by the change, and rerun until `No issues found!` when safely achievable.
- Run relevant tests and report actual commands and results. Never claim a check passed if it was not run.
- Run `flutter pub get` after dependency manifest changes.
- After meaningful work, update `docs/PROJECT_STATUS.md` and the latest entry in `docs/AI_HANDOFF.md` with completed work, files, decisions, unresolved issues, commands/results, and the exact next action.
- Distinguish verified facts from assumptions and planned work.
- Explain progress briefly in simple Romanized Gujarati.
