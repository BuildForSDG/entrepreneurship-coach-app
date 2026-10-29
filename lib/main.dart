import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app_theme.dart';
import 'app/app_shell.dart';

void main() {
  runApp(
    const ProviderScope(
      child: EntrepreneurshipCoachApp(),
    ),
  );
}

class EntrepreneurshipCoachApp extends StatelessWidget {
  const EntrepreneurshipCoachApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entrepreneurship Coach',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const AppShell(),
    );
  }
}
