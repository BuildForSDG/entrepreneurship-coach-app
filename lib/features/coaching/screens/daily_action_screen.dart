import 'package:flutter/material.dart';

class DailyActionScreen extends StatelessWidget {
  const DailyActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Action')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today’s Leadership & Business Focus',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _infoTile('Short lesson', 'Understanding customer acquisition cost'),
            _infoTile('Reflection question', 'What is currently limiting your customer acquisition?'),
            _infoTile('Practical exercise', 'Calculate your customer acquisition cost for the last 30 days.'),
            _infoTile('Business action', 'Review your marketing channels and identify the highest-cost channel.'),
            _infoTile('Leadership action', 'Delegate one marketing task to a team member.'),
            const SizedBox(height: 24),
            const Text(
              'Today’s Challenge',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Identify one process in your business that depends completely on you. Design a simple procedure that another person could follow.',
            ),
            const SizedBox(height: 16),
            TextFormField(
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: 'Submit your answer',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Submit for review'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String title, String content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(content),
          ],
        ),
      ),
    );
  }
}
