import 'package:flutter/material.dart';

class ChallengeCard extends StatelessWidget {
  final String title;
  final String description;
  final bool completed;

  const ChallengeCard({
    super.key,
    required this.title,
    required this.description,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          completed ? Icons.check_circle : Icons.pending_actions,
          color: completed ? Colors.green : Colors.orange,
        ),
        title: Text(title),
        subtitle: Text(description),
        trailing: Text(completed ? 'Done' : 'Open'),
      ),
    );
  }
}
