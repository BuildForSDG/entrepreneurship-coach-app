import 'package:flutter/material.dart';
import 'core/firebase/firebase_setup.dart';
import 'app/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeFirebase();

  runApp(const EntrepreneurshipCoachApp());
}

class EntrepreneurshipCoachApp extends StatelessWidget {
  const EntrepreneurshipCoachApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entrepreneurship Coach',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const Scaffold(
        body: Center(
          child: Text('Entrepreneurship Coach App'),
        ),
      ),
    );
  }
}
