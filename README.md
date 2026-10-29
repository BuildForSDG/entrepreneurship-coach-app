# Entrepreneurship & Leadership Coaching App

This Flutter starter app includes a complete coaching experience for entrepreneurs and leaders, including:

- onboarding and assessment
- personalized scorecard
- coaching dashboard
- AI coach chat
- daily action screen
- weekly challenges
- progress dashboard
- business plan coaching
- leadership plan
- premium gating
- Firebase-ready architecture

## Getting started

1. Install Flutter SDK.
2. Create a Firebase project in the Firebase console.
3. Run:

```bash
flutter pub get
flutterfire configure
flutter run
```

4. If you want to keep the app running in local development without generated Firebase config, the app includes a safe fallback that logs the Firebase setup requirement instead of crashing.

## Project structure

- `lib/app` — app shell and theme
- `lib/core/firebase` — Firebase initialization and setup
- `lib/core/services` — premium and Firestore service layers
- `lib/features/coaching` — models, providers, screens, widgets

## Firebase notes

This project is prepared for Firebase integration using:

- Firebase Core
- Firebase Auth
- Cloud Firestore

The generated Firebase config files will be created by the FlutterFire CLI automatically. 
