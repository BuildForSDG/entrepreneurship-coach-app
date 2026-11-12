
import 'package:flutter/material.dart';

import 'core/firebase/firebase_setup.dart';

// Keep your existing MyApp import here.

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeFirebase();

  runApp(const EntrepreneurshipCoachApp());
}
