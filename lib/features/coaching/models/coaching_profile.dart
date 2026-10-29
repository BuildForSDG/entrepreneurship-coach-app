enum BusinessStage { idea, startup, growing, established }

class CoachingProfile {
  final String id;
  final String name;
  final String ageRange;
  final String country;
  final String educationLevel;
  final String currentOccupation;
  final int yearsBusinessExperience;
  final bool isRunningBusiness;
  final String businessType;
  final BusinessStage businessStage;
  final int employeeCount;
  final String revenueRange;
  final String biggestChallenge;
  final String mainBusinessGoal;
  final DateTime targetAchievementDate;
  final Map<String, int> leadershipScores;
  final CoachingScorecard scorecard;

  CoachingProfile({
    required this.id,
    required this.name,
    required this.ageRange,
    required this.country,
    required this.educationLevel,
    required this.currentOccupation,
    required this.yearsBusinessExperience,
    required this.isRunningBusiness,
    required this.businessType,
    required this.businessStage,
    required this.employeeCount,
    required this.revenueRange,
    required this.biggestChallenge,
    required this.mainBusinessGoal,
    required this.targetAchievementDate,
    required this.leadershipScores,
    required this.scorecard,
  });
}

class CoachingScorecard {
  final int overallScore;
  final List<String> strengths;
  final List<String> developmentAreas;
  final List<String> recommendedTraining;

  CoachingScorecard({
    required this.overallScore,
    required this.strengths,
    required this.developmentAreas,
    required this.recommendedTraining,
  });
}
