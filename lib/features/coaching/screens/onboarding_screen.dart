import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coaching Onboarding')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal Profile',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _textField('Name'),
            _textField('Age range'),
            _textField('Country'),
            _textField('Education level'),
            _textField('Current occupation'),
            _textField('Years of business experience'),
            const SizedBox(height: 24),
            const Text(
              'Entrepreneurship Profile',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _textField('Currently running a business?'),
            _textField('Type of business'),
            _textField('Business stage'),
            _textField('Number of employees'),
            _textField('Approximate monthly revenue range'),
            _textField('Biggest business challenge'),
            _textField('Main business goal'),
            _textField('Target achievement date'),
            const SizedBox(height: 24),
            const Text(
              'Leadership Profile',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _scoreField('Communication'),
            _scoreField('Decision-making'),
            _scoreField('Delegation'),
            _scoreField('Team management'),
            _scoreField('Emotional intelligence'),
            _scoreField('Problem-solving'),
            _scoreField('Strategic thinking'),
            _scoreField('Negotiation'),
            _scoreField('Conflict management'),
            _scoreField('Time management'),
            _scoreField('Accountability'),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Generate My Scorecard'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _scoreField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          SizedBox(
            width: 90,
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: '0-100',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
