import 'package:flutter/material.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final goals = [
      _SmartGoal(
        title: 'Increase revenue',
        reason: 'Grow the business sustainably',
        target: '₦10M annual revenue',
        deadline: '9 months',
      ),
      _SmartGoal(
        title: 'Improve customer acquisition',
        reason: 'Reduce wasted marketing spend',
        target: 'Lower CAC by 20%',
        deadline: '8 weeks',
      ),
      _SmartGoal(
        title: 'Delegate marketing operations',
        reason: 'Free leadership time for strategy',
        target: 'One critical task delegated',
        deadline: 'This week',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('My Goals')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: goals.map((goal) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(goal.title),
              subtitle: Text('${goal.reason} • Target: ${goal.target} • Deadline: ${goal.deadline}'),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _SmartGoal {
  final String title;
  final String reason;
  final String target;
  final String deadline;

  _SmartGoal({
    required this.title,
    required this.reason,
    required this.target,
    required this.deadline,
  });
}
