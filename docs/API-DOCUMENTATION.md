# API Documentation

The app talks to two external data sources: the IGDB game database (proxied through Firebase Cloud Functions) and the Gemini API for AI recommendations. All IGDB requests go through Cloud Functions so that API credentials never touch the client.

## API Endpoints

### 1. Get IGDB Token

**Call name**: getIGDBTokenKF  
**Method**: GET  
**URL**: `https://getigdbtoken-pfuvu2mvja-uc.a.run.app`  
**Region**: us-central1  
**Purpose**: Fetches a short-lived OAuth access token for the IGDB API. Used internally before IGDB search or detail queries.

**Response format**:
```json
{
  "access_token": "string"
}
```

**Authentication**: No client-side auth required. The Cloud Function handles the OAuth exchange with the Twitch authentication service, which manages IGDB credentials.

---

### 2. Search Games

**Call name**: SearchGamesKF  
**Method**: POST  
**URL**: `https://searchgames-pfuvu2mvja-uc.a.run.app`  
**Region**: us-central1  
**Purpose**: Searches the IGDB database for games matching a query string. Returns a list of results with cover art, genres, summary, and release date.

**Request body**:
```json
{
  "query": "string"
}
```

**Response format**:
```json
{
  "games": [
    {
      "id": 123,
      "name": "string",
      "summary": "string",
      "first_release_date": 1609459200,
      "cover": {
        "id": 456,
        "url": "string"
      },
      "genres": [
        {
          "id": 12,
          "name": "string"
        }
      ]
    }
  ]
}
```

**Authentication**: No client-side auth required.

---

### 3. Search Games v2

**Call name**: NewSearchGameCall  
**Method**: POST  
**URL**: `https://searchgamev2-pfuvu2mvja-ue.a.run.app`  
**Region**: us-east1  
**Purpose**: Updated version of the game search endpoint. Same request and response shape as v1. This is the current active search used in the app.

**Request body**:
```json
{
  "query": "string"
}
```

**Authentication**: No client-side auth required.

---

### 4. Get Game Details

**Call name**: getGameDetailsKF  
**Method**: POST  
**URL**: `https://getgamedetails-pfuvu2mvja-uc.a.run.app`  
**Region**: us-central1  
**Purpose**: Returns full details for a specific game by its IGDB ID. Used to populate the Game Info page.

**Request body**:
```json
{
  "gameId": 123
}
```

**Response format**:
```json
{
  "game": {
    "cover": {
      "id": 456,
      "url": "string"
    },
    "summary": "string",
    "rating": 85.5,
    "first_release_date": 1609459200,
    "genres": [
      { "name": "string" }
    ],
    "platforms": [
      { "name": "string" }
    ],
    "developer": "string",
    "screenshots": [
      { "url": "string" }
    ]
  }
}
```

**Authentication**: No client-side auth required.

---

### 5. Gemini Game Recommendation

**Call name**: GeminiRecommendation  
**Method**: POST  
**URL**: `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent`  
**Purpose**: Sends the user's favorites list to Gemini and gets back a single game recommendation with its name, genre, and a short description. Used on the Recommended Games page.

**Request body**:
```json
{
  "contents": [
    {
      "parts": [
        {
          "text": "The user has the following favorite games: {favorites}. Recommend 1 game with name, genre, and short description."
        }
      ]
    }
  ]
}
```

**Response format**:
```json
{
  "candidates": [
    {
      "content": {
        "parts": [
          {
            "text": "string (the recommendation text)"
          }
        ]
      }
    }
  ]
}
```

**Authentication**: API key passed as a query parameter (`?key=...`). The key is managed in the app configuration and should never be committed to version control in plaintext.

---

### 6. SearchGame (Firebase Callable)

**Call name**: SearchGame  
**Type**: Firebase Callable Function  
**Region**: us-east1  
**Purpose**: An earlier callable version of the game search, invoked through the Firebase Functions SDK rather than a direct HTTP call. Still wired up in the codebase.

**Input**:
```json
{
  "callName": "SearchGameCall",
  "variables": {
    "query": "search \"halo\"; fields name,cover.url,summary; limit 20;"
  }
}
```

**Authentication**: Handled by the Firebase Functions SDK. No additional auth setup needed on the client side.
