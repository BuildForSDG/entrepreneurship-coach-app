import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../firebase_options.dart';

Future<void> initializeFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint('Firebase initialized successfully.');
  } on UnsupportedError {
    debugPrint(
      'Firebase options are not configured yet. Run `flutterfire configure` and then rerun the app.',
    );
  } catch (error) {
    debugPrint('Firebase initialization failed: $error');
  }
}
