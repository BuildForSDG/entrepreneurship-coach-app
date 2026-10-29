import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    throw UnsupportedError(
      'Firebase is not configured. Run `flutterfire configure` to generate the proper Firebase options for this project.',
    );
  }
}
