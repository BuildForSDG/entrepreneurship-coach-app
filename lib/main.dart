import 'package:flutter/material.dart';
import 'core/firebase/firebase_setup.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeFirebase();

  runApp(const EntrepreneurshipCoachApp());
}
