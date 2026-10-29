class LeadershipSkillGoal {
  final String skill;
  final String currentLevel;
  final String targetLevel;
  final String practice;
  final String measurement;

  LeadershipSkillGoal({
    required this.skill,
    required this.currentLevel,
    required this.targetLevel,
    required this.practice,
    required this.measurement,
  });
}

class LeadershipPlan {
  final List<LeadershipSkillGoal> skillGoals;

  LeadershipPlan({required this.skillGoals});
}
