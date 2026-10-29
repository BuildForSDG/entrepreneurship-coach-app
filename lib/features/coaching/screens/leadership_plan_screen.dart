import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/coaching_provider.dart';

class LeadershipPlanScreen extends ConsumerWidget {
  const LeadershipPlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leadershipPlan = ref.watch(coachingProvider).leadershipPlan;

    if (leadershipPlan == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Leadership Development Plan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: leadershipPlan.skillGoals.map((goal) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(goal.skill, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Current level: ${goal.currentLevel}'),
                  Text('Target: ${goal.targetLevel}'),
                  const SizedBox(height: 8),
                  Text('Practice: ${goal.practice}'),
                  const SizedBox(height: 8),
                  Text('Measurement: ${goal.measurement}'),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
