# AI Agent Handoff Protocol

Use this protocol when switching between GitHub Copilot, Claude, OpenAI Codex, Google Antigravity, or another assistant. These documents are the shared project memory; they do not synchronize private chat history, credentials, or tool state.

## Required reading for every agent

Before work, explicitly read these repository files in order:

1. `AGENTS.md` — shared project rules and safety requirements.
2. `README.md` — project scope, actual structure, setup, and implementation status.
3. `docs/ARCHITECTURE.md` — current architecture, proposals, and unresolved decisions.
4. `docs/PROJECT_STATUS.md` — current phase, completed work, blockers, and exact next action.
5. `docs/AI_HANDOFF.md` — this protocol and latest handoff record.
6. The applicable tool entry/instructions from the table below.
7. Any task-specific files, after inspecting them and the working tree.

| Agent | Project-specific entry file to read | Loading note |
| --- | --- | --- |
| GitHub Copilot | `.github/copilot-instructions.md` | Workspace instruction auto-loading depends on the client; explicitly read it if not shown as loaded. |
| Claude | `CLAUDE.md` and `.claude/rules/intructions.instructions.md` | Explicitly read them if the client did not load them. |
| OpenAI Codex | `AGENTS.md` | Do not assume nested or external documentation was loaded; read the required list above. |
| Google Antigravity | `AGENTS.md` | Antigravity-specific discovery of these files is not verified; open/read the required files manually in its workspace context. |

No extension, MCP service, account integration, or automatic synchronization among these tools has been verified or configured by this protocol.

## Start-of-task checklist

1. Confirm the working directory and current branch.
2. Run `git status --short --branch`, inspect relevant diffs, and identify tracked versus untracked files before editing.
3. Read the required documents above and identify the current phase and next incomplete task.
4. Verify current files and tool output instead of trusting an old handoff when facts could have changed.
5. Confirm that the user authorized the requested edits, installs, Firebase operations, or Git actions.
6. Do not repeat completed work unless verification shows it needs correction.

## End-of-task checklist

After meaningful work:

1. Update `docs/PROJECT_STATUS.md` with phase, completed/in-progress/pending work, issues, and exact next action.
2. Append a dated/identified entry to the handoff log below. Preserve earlier entries; do not erase another agent's useful history.
3. Record changed files, decisions and their approval status, unresolved blockers, commands actually executed, and real analysis/test outcomes.
4. Keep README and architecture documentation consistent with verified behavior; label proposals and plans clearly.
5. Review `git status` and relevant diffs. Never stage, commit, push, or discard work without approval.

## Handoff entry format

Add a new entry at the top of the log:

```text
## Handoff — YYYY-MM-DD — <agent/tool or task>

- Phase:
- Completed:
- Files changed:
- Decisions: approved / proposed / unresolved
- Commands and actual results:
- Blockers and limitations:
- Exact next action:
- Git status:
```

Do not fill fields with assumptions. State “not run” or “not verified” when applicable. Do not put credentials, tokens, or secrets in handoff records.

## Handoff log

## Handoff — 2026-10-29 — Android primary target

- Phase: Foundation and configuration; Android is the approved primary platform.
- Completed: Recorded the user's Android-first direction in shared instructions, project overview, architecture, and project status.
- Files changed: `AGENTS.md`, `README.md`, `docs/ARCHITECTURE.md`, `docs/PROJECT_STATUS.md`, `docs/AI_HANDOFF.md`.
- Decisions: Approved Android phone app as initial priority, including Android UI/build/Firebase validation and eventual APK/AAB delivery. iOS/Web remain future-extensible, lower priority. Production Android application ID, SDK license acceptance, release signing, Firebase service activation, and app architecture remain unresolved.
- Commands and actual results: `git diff --check` passed; README/documentation path checks passed. `git status` shows only the existing tracked `README.md` modification and no staged files; all source/config paths remain in their prior untracked state. Flutter analysis/tests and Android builds were not run because application code/dependencies are unchanged and this task only records the platform decision.
- Blockers and limitations: Android licenses/build/runtime/Firebase integration are not verified; current Android Firebase app ID uses `com.example.appointment_pro`.
- Exact next action: Confirm the production Android application ID and Android SDK license acceptance; then verify an Android debug build and Firebase Android integration before Android UI foundation work.
- Git status: Preserve pre-existing README modifications and all untracked files. Do not stage, commit, or push.

## Handoff — 2026-10-29 — Multi-AI continuity documentation

- Phase: Foundation and configuration remains in progress; continuity documentation has been added.
- Completed: Inspected Git state, README, project rules, VS Code settings, Flutter dependencies, Firebase initialization/configuration, and ignore rules; prepared shared rules and handoff documents.
- Files changed: `README.md`, `AGENTS.md`, `CLAUDE.md`, `.github/copilot-instructions.md`, `.claude/rules/intructions.instructions.md`, `docs/ARCHITECTURE.md`, `docs/PROJECT_STATUS.md`, `docs/AI_HANDOFF.md`.
- Decisions: `AGENTS.md` is the shared agent policy entry; `README.md` describes the project, `docs/ARCHITECTURE.md` records implementation/decisions, and the status/handoff files record operational continuity. No state manager, router, DI, data schema, Firebase service activation, or agent auto-sync has been approved.
- Commands and actual results: `git diff --check` passed. `git status --short --branch` and `git ls-files` confirmed `main`, `origin/main`, only `README.md` tracked, and no staged files. README path checks passed; all required docs exist. `git check-ignore` confirmed `.dart_tool/`, `build/`, Android local properties, generated iOS config, and `.flutter-plugins-dependencies` are ignored; source, Firebase client config, and `.vscode/settings.json` are not ignored. Flutter analysis/tests were not run because this task changed documentation/instructions only.
- Blockers and limitations: Only `README.md` is tracked and locally modified; source/platform/config files remain untracked. Firestore region/activation, final app identifiers, Firebase provider/notification setup, and architecture approval remain unresolved.
- Exact next action: Confirm the final Android/iOS identifiers and Firestore activation/region, then approve state/routing/DI and feature-structure architecture before implementation. Separately present the exact Git staging file list and wait for approval before staging.
- Git status: No staging, commit, push, pull, merge, rebase, or history change authorized.
