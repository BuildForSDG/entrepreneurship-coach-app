import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/coaching_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(coachingProvider);
    final profile = state.profile;
    final progress = state.progress;

    if (profile == null || progress == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'YOUR COACHING TODAY',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text('Main Goal: ${profile.mainBusinessGoal}'),
                  const SizedBox(height: 8),
                  const Text('Today’s Focus: Improve customer acquisition'),
                  const SizedBox(height: 8),
                  const Text('Today’s Lesson: Understanding customer acquisition cost'),
                  const SizedBox(height: 8),
                  const Text('Today’s Action: Calculate your CAC for the last 30 days.'),
                  const SizedBox(height: 8),
                  const Text('Leadership Challenge: Delegate one marketing task to a team member.'),
                  const SizedBox(height: 12),
                  Text(
                    'Coach: "Before we continue, tell me what is currently limiting your customer acquisition."',
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              _MetricCard(label: 'Overall', value: '${progress.overallProgress}%'),
              _MetricCard(label: 'Entrepreneurship', value: '${progress.entrepreneurshipProgress}%'),
              _MetricCard(label: 'Leadership', value: '${progress.leadershipProgress}%'),
              _MetricCard(label: 'Streak', value: '${progress.currentStreak} days'),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Skills developed',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: progress.skillsDeveloped
                .map((skill) => Chip(label: Text(skill)))
                .toList(),
          ),
          const SizedBox(height: 16),
          const Text(
            'Upcoming milestones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...progress.upcomingMilestones.map((milestone) => ListTile(
                leading: const Icon(Icons.flag),
                title: Text(milestone),
              )),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label;
  final String value;

  const _MetricCard({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
