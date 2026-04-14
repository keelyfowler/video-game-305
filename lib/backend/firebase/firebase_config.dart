import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDjjlj9e327UiDgy_jqWyEuUzEfZcJ1kmk",
            authDomain: "video-game-tracker-cea14.firebaseapp.com",
            projectId: "video-game-tracker-cea14",
            storageBucket: "video-game-tracker-cea14.firebasestorage.app",
            messagingSenderId: "532733071780",
            appId: "1:532733071780:web:6f99dfdaf239bdcf73b131",
            measurementId: "G-35KLHPDZN0"));
  } else {
    await Firebase.initializeApp();
  }
}
