enum PlanDuration { days30, days60, days90 }

class CoachingPlan {
  final String id;
  final PlanDuration duration;
  final List<CoachingModule> entrepreneurshipModules;
  final List<CoachingModule> leadershipModules;

  CoachingPlan({
    required this.id,
    required this.duration,
    required this.entrepreneurshipModules,
    required this.leadershipModules,
  });
}

class CoachingModule {
  final String title;
  final String description;
  final int targetWeeks;
  final List<String> objectives;

  CoachingModule({
    required this.title,
    required this.description,
    required this.targetWeeks,
    required this.objectives,
  });
}
