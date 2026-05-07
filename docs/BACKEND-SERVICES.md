# Backend Services

## Authentication

Firebase Authentication handles all user identity management. The `FirebaseAuthManager` class in `lib/auth/firebase_auth/firebase_auth_manager.dart` wraps every sign-in flow. On first sign-in, the app calls `maybeCreateUser` to create a new document in the `users` Firestore collection with the user's Auth UID as the document ID.

### Sign-in Methods

**Email and Password**: Standard registration and login with email/password credentials. Password reset is supported via `sendPasswordResetEmail`.

**Google**: OAuth sign-in through Google. Handled by `GoogleSignInManager`. Requires the `google_sign_in` package.

**Apple**: OAuth sign-in for iOS users using `sign_in_with_apple`. Handled by `AppleSignInManager`.

**GitHub**: OAuth sign-in via GitHub. Handled by `GithubSignInManager`.

**Anonymous**: Users can access the app without creating an account. Handled by `AnonymousSignInManager`.

**Phone**: SMS verification flow managed by `FirebasePhoneAuthManager`. Auto-verification is disabled by default (the timeout is set to 0 seconds). Supports both Android and web confirmation flows.

**JWT**: Custom token sign-in for integrating external auth systems. Handled by `JwtSignInManager`.

### Firebase Analytics Integration
Every sign-in event logs the auth provider used (e.g., `EMAIL`, `GOOGLE`, `APPLE`). Sign-out and account deletion are also logged as `SIGN_OUT` and `DELETE_USER` respectively.

---

## Cloud Functions

Cloud Functions act as a secure proxy between the Flutter app and the IGDB API. The app never calls IGDB directly so credentials stay off the client side. Functions are deployed across two regions.

### getIGDBTokenKF (us-central1)
Fetches an IGDB OAuth token by exchanging credentials with Twitch's auth service. Called internally before IGDB queries.

### SearchGamesKF (us-central1)
Accepts a game title query string and returns matching results from IGDB including name, cover art, genres, summary, and release date.

### NewSearchGame / searchgamev2 (us-east1)
The current active version of game search. Same inputs and outputs as SearchGamesKF. Deployed in us-east1.

### getGameDetailsKF (us-central1)
Accepts an IGDB game ID and returns full game details: cover, summary, rating, release date, genres, platforms, developer, and screenshots.

### SearchGame (Callable, us-east1)
An earlier Firebase callable version of the game search. Accepts a raw IGDB query string and is invoked via the Firebase Functions SDK.

For full request and response formats for each function, see the [API Documentation page](API-DOCUMENTATION.md).

---

## Database Security

Firestore security rules are defined in `firebase/firestore.rules`. Here are the current rules:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{document} {
      allow create: if request.auth.uid == document;
      allow read: if request.auth.uid == document;
      allow write: if request.auth.uid == document;
      allow delete: if request.auth.uid == document;
    }

    match /nps_responses/{document} {
      allow create: if true;
      allow read: if true;
      allow write: if false;
      allow delete: if false;
    }

    match /reviews/{document} {
      allow create: if true;
      allow read: if true;
      allow write: if false;
      allow delete: if false;
    }

    match /favorites/{document} {
      allow create: if true;
      allow read: if true;
      allow write: if true;
      allow delete: if true;
    }
  }
}
```

What each rule means in practice:

**users**: Only the authenticated user who owns the document can read, write, create, or delete it. The rule checks that `request.auth.uid` matches the document ID, which is set to the user's UID on creation. No user can access another user's profile document.

**reviews**: Anyone (including unauthenticated users) can create and read reviews. Existing reviews cannot be updated or deleted once written.

**nps_responses**: Anyone can create or read NPS responses. Once submitted, responses cannot be modified or removed.

**favorites**: Fully open at the moment. Any user can create, read, update, or delete any favorites document. This is something worth tightening in a future update to restrict write/delete to the owning user.

---

## Metrics and Analytics

Firebase Analytics is used throughout the app via the `logFirebaseEvent` helper. DAU, session data, and retention are collected automatically by the Firebase SDK. Custom events are fired for key user interactions.

| Event Name | When It Fires |
|---|---|
| SIGN_OUT | User signs out |
| DELETE_USER | User deletes their account |
| search_performed | User submits a game search query |
| game_clicked | User taps a game from search results |
| review_started | User opens the review form |
| review_completed | User submits a completed review |
| signup_screen_viewed | The sign-up screen is shown to a new user |
| signup_completed | A user finishes creating an account |
| profile_complete | A user finishes setting up their profile |
| review_posted | A review is saved to Firestore |

Analytics data is viewable in the Firebase console. NPS responses are also stored directly in the `nps_responses` Firestore collection for manual review.

For the full HEART framework metrics breakdown and how each metric maps to these events, see the [Metrics page](METRICS.md).

---

## A/B Testing

See the [A/B Testing page](ABTEST.md) for full details on each experiment. All four tests use Firebase Analytics event tracking to compare variants. Tests currently in place:

1. Single-step vs multi-step review creation flow (measures review completion rate and weekly reviews per user)
2. One-screen vs two-screen login/signup flow (measures new signup rate)
3. Prompted vs skippable profile setup during onboarding (measures review posting rate after signup)
4. Generic home screen vs personalized welcome-back feed (measures 7-day and 30-day retention)

---

## AI Services

### Gemini API
Used on the Recommended Games page. The app sends the user's favorites list as a prompt and the `gemini-2.0-flash` model returns one game recommendation with name, genre, and a short description.

The `google_generative_ai` SDK is also used directly for broader AI text generation tasks:
- `geminiGenerateText` uses `gemini-1.5-pro` for text prompts
- `geminiTextFromImage` uses `gemini-1.5-flash` for image-based prompts

Both utility functions live in `lib/backend/gemini/gemini.dart`.

API keys are passed at the call level and should be managed through environment configuration, not committed to source control.

### Firebase Vertex AI
The `ChatManager` class in `lib/backend/ai_agents/firebase_vertexai_agent.dart` manages multi-turn chat sessions through Firebase Vertex AI. It is a singleton that keeps a map of active chat sessions indexed by thread ID.

Key behaviors:
- Sessions are initialized lazily on the first message to a given thread ID
- Multiple concurrent sessions are supported
- Model parameters (temperature, topP, max tokens) are configurable per session via an agent JSON config
- Supported response formats are plain text, markdown, and JSON
- Multimodal inputs are supported: text, images, audio, video, and PDFs
- Chat history is preserved per thread until `clearChat` is called

---

## Remote Configuration

`firebase_remote_config` is included as a dependency (version 5.4.5), which means the app is set up to support Firebase Remote Config. Remote Config allows feature flags and app behavior to be updated without pushing a new release.

Document the specific keys being controlled and the conditions under which they would be updated here as they are configured.

---

## Performance Monitoring

`firebase_performance` is included as a dependency (version 0.10.1+7). Firebase Performance Monitoring automatically tracks app startup time, HTTP request latency, and screen rendering performance. Custom traces can be added around key user flows if needed.
