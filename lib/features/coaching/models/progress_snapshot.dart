class ProgressSnapshot {
  final int overallProgress;
  final int entrepreneurshipProgress;
  final int leadershipProgress;
  final int coursesCompleted;
  final int challengesCompleted;
  final int assignmentsCompleted;
  final int currentStreak;
  final List<String> skillsDeveloped;
  final List<String> upcomingMilestones;
  final Map<String, int> weeklyPerformance;
  final List<String> personalGoals;

  ProgressSnapshot({
    required this.overallProgress,
    required this.entrepreneurshipProgress,
    required this.leadershipProgress,
    required this.coursesCompleted,
    required this.challengesCompleted,
    required this.assignmentsCompleted,
    required this.currentStreak,
    required this.skillsDeveloped,
    required this.upcomingMilestones,
    required this.weeklyPerformance,
    required this.personalGoals,
  });
}
