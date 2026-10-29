import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/providers/auth_provider.dart';
import '../../features/auth/screens/auth_screen.dart';
import '../../features/coaching/screens/ai_coach_screen.dart';
import '../../features/coaching/screens/business_plan_screen.dart';
import '../../features/coaching/screens/daily_action_screen.dart';
import '../../features/coaching/screens/dashboard_screen.dart';
import '../../features/coaching/screens/goals_screen.dart';
import '../../features/coaching/screens/leadership_plan_screen.dart';
import '../../features/coaching/screens/onboarding_screen.dart';
import '../../features/coaching/screens/progress_screen.dart';
import '../../features/coaching/screens/weekly_challenge_screen.dart';

class AppShell extends ConsumerWidget {
  const AppShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);

    return authState.when(
      data: (user) {
        if (user == null) {
          return const AuthScreen();
        }

        return const CoachingNavigator();
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(
          child: Text('Authentication error: $error'),
        ),
      ),
    );
  }
}

class CoachingNavigator extends StatefulWidget {
  const CoachingNavigator({super.key});

  @override
  State<CoachingNavigator> createState() => _CoachingNavigatorState();
}

class _CoachingNavigatorState extends State<CoachingNavigator> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    DashboardScreen(),
    DailyActionScreen(),
    AICoachScreen(),
    WeeklyChallengeScreen(),
    ProgressScreen(),
    BusinessPlanScreen(),
    LeadershipPlanScreen(),
    GoalsScreen(),
    OnboardingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) => setState(() => _selectedIndex = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.lightbulb), label: 'Daily'),
          NavigationDestination(icon: Icon(Icons.psychology), label: 'Coach'),
          NavigationDestination(icon: Icon(Icons.emoji_events), label: 'Challenges'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Progress'),
          NavigationDestination(icon: Icon(Icons.business), label: 'Plan'),
          NavigationDestination(icon: Icon(Icons.leaderboard), label: 'Leadership'),
          NavigationDestination(icon: Icon(Icons.flag_circle), label: 'Goals'),
          NavigationDestination(icon: Icon(Icons.assignment_ind), label: 'Profile'),
        ],
      ),
    );
  }
}
