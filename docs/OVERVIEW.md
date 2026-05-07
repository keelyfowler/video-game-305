# Overview

## Project Name
Video Game Tracker / Reviewer

## Purpose
Video Game Tracker is a mobile app that gives gamers a place to search for games, write reviews, track their favorites, and get personalized game recommendations powered by AI. The goal is to build a community-driven space where players can share their takes, discover new titles, and keep a running log of what they have played or want to play.

## Brief Description
The app is built with Flutter and FlutterFlow and pulls live game data from the IGDB database through a set of Firebase Cloud Functions. User data, reviews, and favorites are all stored in Firestore. Authentication goes through Firebase Auth, Gemini AI drives the recommendation engine, and Firebase Analytics tracks user behavior across the app.

## Main Features
- Search the IGDB game database by title
- View full game details including cover art, summary, rating, genres, platforms, developer, and screenshots
- Write and browse star-rated game reviews
- Save games to a personal favorites list
- Get AI-generated game recommendations based on your favorites
- Create and edit a profile with your gaming identity (username, bio, favorite genre, Discord handle, Twitch name)
- NPS survey that collects user satisfaction feedback after engagement

## Technologies Used
- Flutter and FlutterFlow (frontend framework)
- Dart (programming language, SDK 3.x)
- Firebase Firestore (NoSQL database)
- Firebase Authentication (user accounts and sign-in)
- Firebase Cloud Functions (server-side logic and IGDB API proxy)
- Firebase Analytics (event tracking and metrics collection)
- Firebase Storage (media uploads)
- Firebase Remote Config (feature configuration)
- Firebase Performance Monitoring
- Firebase Vertex AI (multi-turn AI chat sessions)
- Gemini API via google_generative_ai package (game recommendations and text generation)
- IGDB API (game data source, accessed through Cloud Functions)
- go_router (client-side navigation)
- provider (state management)
