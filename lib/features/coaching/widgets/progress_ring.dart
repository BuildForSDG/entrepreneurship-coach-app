import 'package:flutter/material.dart';

class ProgressRing extends StatelessWidget {
  final double progress;
  final String label;
  final Color color;

  const ProgressRing({
    super.key,
    required this.progress,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 72,
          height: 72,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: progress,
                strokeWidth: 8,
                backgroundColor: Colors.grey.shade200,
                color: color,
              ),
              Text('${(progress * 100).round()}%'),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
