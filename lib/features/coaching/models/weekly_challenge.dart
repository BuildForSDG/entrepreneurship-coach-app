class WeeklyChallenge {
  final String id;
  final int weekNumber;
  final String title;
  final String description;
  final String stage;
  final bool completed;
  final DateTime dueDate;

  WeeklyChallenge({
    required this.id,
    required this.weekNumber,
    required this.title,
    required this.description,
    required this.stage,
    required this.completed,
    required this.dueDate,
  });
}
