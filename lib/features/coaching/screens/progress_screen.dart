import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/coaching_provider.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(coachingProvider).progress;

    if (progress == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Progress')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionTitle('Overview'),
          MetricRow('Overall', '${progress.overallProgress}%'),
          MetricRow('Entrepreneurship', '${progress.entrepreneurshipProgress}%'),
          MetricRow('Leadership', '${progress.leadershipProgress}%'),
          MetricRow('Courses completed', '${progress.coursesCompleted}'),
          MetricRow('Challenges completed', '${progress.challengesCompleted}'),
          MetricRow('Assignments completed', '${progress.assignmentsCompleted}'),
          MetricRow('Current streak', '${progress.currentStreak} days'),
          const SizedBox(height: 20),
          const SectionTitle('Skills developed'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: progress.skillsDeveloped.map((s) => Chip(label: Text(s))).toList(),
          ),
          const SizedBox(height: 20),
          const SectionTitle('Personal goals'),
          ...progress.personalGoals.map((goal) => ListTile(
                leading: const Icon(Icons.check_circle_outline),
                title: Text(goal),
              )),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MetricRow extends StatelessWidget {
  final String label;
  final String value;

  const MetricRow(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
