
import 'package:flutter/material.dart';
import 'core/firebase/firebase_setup.dart';
import 'app/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    debugPrint('FLUTTER ERROR: ${details.exception}');
    debugPrintStack(stackTrace: details.stack);
  };

  try {
    debugPrint('Starting GladstarGTSchool...');
    
    await initializeFirebase();

    debugPrint('Firebase initialized successfully.');

    runApp(const EntrepreneurshipCoachApp());
  } catch (error, stackTrace) {
    debugPrint('STARTUP ERROR: $error');
    debugPrintStack(stackTrace: stackTrace);

    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'Application startup failed.\n$error',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EntrepreneurshipCoachApp extends StatelessWidget {
  const EntrepreneurshipCoachApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gladstar GT School',
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
