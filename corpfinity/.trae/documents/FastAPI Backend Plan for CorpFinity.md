## App Analysis Summary
- Root navigation in `lib/main_app.dart:10` with tabs for Home, Challenges, Progress, Profile.
- Auth flow uses stubbed service in `lib/features/auth/auth_service.dart:3`; sign-in `auth_service.dart:16`, sign-up `auth_service.dart:35`, reset password `auth_service.dart:88`; wrapper gates routes (`lib/features/auth/auth_service.dart:107`, `lib/main.dart:45`).
- Sign-in UI at `lib/features/auth/sign_in_page.dart:10` calls `AuthService().signIn` (`sign_in_page.dart:234`); sign-up UI at `lib/features/auth/sign_up_page.dart:11` calls `AuthService().signUp` (`sign_up_page.dart:321`).
- Challenge session runner `lib/features/active_challenge/active_challenge_session_page.dart:6`; Home and Creator build activities inline and navigate to session.
- Progress screen `lib/features/progress/progress_page.dart:3` displays static metrics; Profile `lib/features/profile/profile_page.dart:5` shows static user and triggers `signOut()`.
- No real API calls, persistence, or state management beyond in-memory flags.

## Backend Scope (Features Needing Backend)
- Authentication: Email/password, OAuth (Google/Facebook), password reset, email verification, JWT access/refresh.
- User Profiles: Read/update profile, avatar upload, privacy actions (delete/account export).
- Challenges: Save user-created challenges/templates; list preset activities.
- Sessions & Logs: Start/complete sessions, activity events, pause/resume; store durations and outcomes.
- Progress & Analytics: Aggregated summaries (week/month/year), streaks, recent activity, export data.
- Notifications (optional): Reminders via push (FCM) or email scheduling.
- Sharing (optional): Generate shareable links for progress.

## API Design (Initial)
- `POST /auth/signup` — body: `username, email, password`; returns user + tokens.
- `POST /auth/login` — body: `email, password`; returns user + tokens.
- `POST /auth/oauth/google` / `POST /auth/oauth/facebook` — exchange provider token for app tokens.
- `POST /auth/password/request` — begin reset (email link/code).
- `POST /auth/password/reset` — apply reset with token/code.
- `POST /auth/token/refresh` — return new access token.
- `GET /me` — current user profile.
- `PUT /me` — update profile fields.
- `POST /me/avatar` — upload avatar (multipart).
- `GET /activities` — list preset activities.
- `POST /challenges` — create custom challenge (name, activities, durations).
- `GET /challenges` / `GET /challenges/{id}` / `DELETE /challenges/{id}` — manage saved challenges.
- `POST /sessions` — start session for a challenge; returns session id.
- `PATCH /sessions/{id}` — complete/abort; includes totals.
- `POST /sessions/{id}/events` — log step transitions, pauses, resumes.
- `GET /sessions` — list history (paginate).
- `GET /progress/summary?range=week|month|year` — totals, streaks, points.
- `GET /progress/recent` — recent activity items.

## Data Model (Draft)
- User: `id, email, username, password_hash, avatar_url, created_at, verified_at`.
- Challenge: `id, user_id, name, activities:[{title,type,duration}], created_at`.
- Session: `id, user_id, challenge_id, status, started_at, completed_at, total_duration, points`.
- SessionEvent: `id, session_id, type(start|pause|resume|next|prev|complete), timestamp, activity_index`.

## Implementation Stack
- FastAPI + Pydantic for APIs and schemas.
- SQLAlchemy/SQLModel + Alembic for Postgres migrations.
- Auth: `pyjwt` for JWT, password hashing via `passlib` (bcrypt/argon2).
- Storage: S3-compatible (or local) for avatars; presigned URLs.
- Background: FastAPI `BackgroundTasks` initially; optionally Celery/Redis later.
- Rate limiting & CORS: `slowapi` or middleware; configure CORS for Flutter.

## Security & Auth Flow
- Access/refresh JWT pair; `Authorization: Bearer <token>` to protect routes.
- Email verification tokens via signed links.
- OAuth: Backend handles provider token verification and user linkage; returns app JWTs.
- Logging and audit trails for account actions.

## Flutter Integration Plan
- Replace `AuthService` with real HTTP client using `dio` or `http`.
- Persist tokens with `flutter_secure_storage`; inject into `Authorization` header.
- Update SignIn/SignUp pages to handle API errors and loading.
- Wire Progress and Profile pages to fetch from `/progress/*` and `/me`.
- Post session lifecycle to `/sessions` and `/sessions/{id}/events` from `ActiveChallengeSessionPage`.

## Milestones
- Phase 1: Auth core (`/auth/signup`, `/auth/login`, tokens, `/me`).
- Phase 2: Challenges & Sessions (`/activities`, `/challenges`, `/sessions`).
- Phase 3: Progress & Analytics (`/progress/*`).
- Phase 4: Avatars, notifications, sharing (optional).

## Deliverables
- FastAPI app with OpenAPI docs, env-configured DB.
- Dockerfile + Compose (API + Postgres).
- Alembic migrations, seed for preset activities.
- Postman/Insomnia collection or curl scripts to verify endpoints.

## Assumptions
- Postgres as primary DB; JWT auth; mobile app consumes JSON REST.
- Notifications via FCM if needed; emails via transactional provider.

Please confirm this plan. Once approved, I’ll implement Phase 1 and integrate the Flutter app’s `AuthService` with the new endpoints.