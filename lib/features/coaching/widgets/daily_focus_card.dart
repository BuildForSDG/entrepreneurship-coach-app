import 'package:flutter/material.dart';

class DailyFocusCard extends StatelessWidget {
  final String lesson;
  final String reflectionQuestion;
  final String action;

  const DailyFocusCard({
    super.key,
    required this.lesson,
    required this.reflectionQuestion,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Today’s lesson', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(lesson),
            const SizedBox(height: 12),
            const Text('Reflection question', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(reflectionQuestion),
            const SizedBox(height: 12),
            const Text('Action', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(action),
          ],
        ),
      ),
    );
  }
}
