import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'firebase_options.dart';

Future<void> initializeFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (kDebugMode) {
      debugPrint('Firebase initialized successfully.');
    }
  } on UnsupportedError {
    if (kDebugMode) {
      debugPrint(
        'Firebase config is not generated yet. Run `flutterfire configure` and then restart the app.',
      );
    }
  } catch (error) {
    if (kDebugMode) {
      debugPrint('Firebase initialization failed: $error');
    }
  }
}
