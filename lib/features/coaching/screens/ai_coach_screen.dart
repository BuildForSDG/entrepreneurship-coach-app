import 'package:flutter/material.dart';

class AICoachScreen extends StatelessWidget {
  const AICoachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Coach')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  _ChatBubble(
                    isCoach: true,
                    text: 'Before we continue, tell me what is currently limiting your customer acquisition.',
                  ),
                  _ChatBubble(
                    isCoach: false,
                    text: 'Our conversion rate has dropped because our ads are attracting poor-fit leads.',
                  ),
                  _ChatBubble(
                    isCoach: true,
                    text: 'That is useful. What are the top three assumptions behind that problem, and which one do you want to test first?',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    minLines: 1,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: 'Type your response...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Send'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final bool isCoach;
  final String text;

  const _ChatBubble({
    super.key,
    required this.isCoach,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCoach ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 310),
        decoration: BoxDecoration(
          color: isCoach ? Colors.blue.shade50 : Colors.green.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text),
      ),
    );
  }
}
