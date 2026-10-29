import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/business_plan.dart';
import '../models/coaching_plan.dart';
import '../models/coaching_profile.dart';
import '../models/daily_focus.dart';
import '../models/leadership_plan.dart';
import '../models/progress_snapshot.dart';
import '../models/weekly_challenge.dart';

class CoachingState {
  final CoachingProfile? profile;
  final CoachingPlan? plan;
  final DailyFocus? dailyFocus;
  final List<WeeklyChallenge> weeklyChallenges;
  final ProgressSnapshot? progress;
  final BusinessPlan? businessPlan;
  final LeadershipPlan? leadershipPlan;

  CoachingState({
    this.profile,
    this.plan,
    this.dailyFocus,
    this.weeklyChallenges = const [],
    this.progress,
    this.businessPlan,
    this.leadershipPlan,
  });

  CoachingState copyWith({
    CoachingProfile? profile,
    CoachingPlan? plan,
    DailyFocus? dailyFocus,
    List<WeeklyChallenge>? weeklyChallenges,
    ProgressSnapshot? progress,
    BusinessPlan? businessPlan,
    LeadershipPlan? leadershipPlan,
  }) {
    return CoachingState(
      profile: profile ?? this.profile,
      plan: plan ?? this.plan,
      dailyFocus: dailyFocus ?? this.dailyFocus,
      weeklyChallenges: weeklyChallenges ?? this.weeklyChallenges,
      progress: progress ?? this.progress,
      businessPlan: businessPlan ?? this.businessPlan,
      leadershipPlan: leadershipPlan ?? this.leadershipPlan,
    );
  }
}

class CoachingNotifier extends StateNotifier<CoachingState> {
  CoachingNotifier() : super(CoachingState());

  void loadDemoData() {
    final profile = CoachingProfile(
      id: 'user_01',
      name: 'Adebayo',
      ageRange: '25-34',
      country: 'Nigeria',
      educationLevel: 'Bachelor’s Degree',
      currentOccupation: 'Business Owner',
      yearsBusinessExperience: 4,
      isRunningBusiness: true,
      businessType: 'E-commerce',
      businessStage: BusinessStage.growing,
      employeeCount: 8,
      revenueRange: '₦5M - ₦10M yearly',
      biggestChallenge: 'Customer acquisition and poor conversion',
      mainBusinessGoal: 'Grow business from ₦5M to ₦10M annual revenue',
      targetAchievementDate: DateTime.now().add(const Duration(days: 260)),
      leadershipScores: {
        'communication': 72,
        'decisionMaking': 68,
        'delegation': 52,
        'teamManagement': 60,
        'emotionalIntelligence': 74,
        'problemSolving': 78,
        'strategicThinking': 66,
        'negotiation': 63,
        'conflictManagement': 58,
        'timeManagement': 61,
        'accountability': 70,
      },
      scorecard: CoachingScorecard(
        overallScore: 67,
        strengths: ['Problem solving', 'Emotional intelligence', 'Customer focus'],
        developmentAreas: ['Delegation', 'Team management', 'Financial forecasting'],
        recommendedTraining: [
          'Leadership fundamentals',
          'Delegation systems',
          'Cash-flow planning',
        ],
      ),
    );

    final plan = CoachingPlan(
      id: 'plan_1',
      duration: PlanDuration.days90,
      entrepreneurshipModules: [
        CoachingModule(
          title: 'Customer acquisition',
          description: 'Increase qualified leads and improve conversion',
          targetWeeks: 3,
          objectives: ['Define target customer', 'Measure CAC', 'Improve conversion funnel'],
        ),
        CoachingModule(
          title: 'Business systems',
          description: 'Create repeatable operations',
          targetWeeks: 4,
          objectives: ['Map key workflows', 'Document SOPs', 'Build team handoff process'],
        ),
      ],
      leadershipModules: [
        CoachingModule(
          title: 'Delegation',
          description: 'Delegate without losing control',
          targetWeeks: 3,
          objectives: ['Define ownership', 'Assign one key task', 'Review weekly'],
        ),
        CoachingModule(
          title: 'Strategic leadership',
          description: 'Lead with clarity and direction',
          targetWeeks: 4,
          objectives: ['Set weekly priorities', 'Review KPIs', 'Improve communication rhythm'],
        ),
      ],
    );

    final dailyFocus = DailyFocus(
      id: 'daily_1',
      title: 'Customer acquisition',
      lesson: 'Understanding customer acquisition cost',
      reflectionQuestion: 'What is currently limiting your customer acquisition?',
      practicalExercise: 'Calculate your CAC for the last 30 days.',
      businessAction: 'Review your last 30 days of ads and sales and identify the most expensive channel.',
      leadershipAction: 'Delegate one marketing task to a team member.',
      challengeText:
          'Identify one process in your business that depends completely on you. Design a simple procedure another person could follow.',
    );

    final weeklyChallenges = [
      WeeklyChallenge(
        id: 'wc_1',
        weekNumber: 1,
        title: 'Define your ideal customer',
        description: 'Describe your ideal customer by pain points, buying behavior, and urgency.',
        stage: 'growing',
        completed: false,
        dueDate: DateTime.now().add(const Duration(days: 7)),
      ),
      WeeklyChallenge(
        id: 'wc_2',
        weekNumber: 2,
        title: 'Interview five potential customers',
        description: 'Talk to five potential customers and record what they care about most.',
        stage: 'growing',
        completed: false,
        dueDate: DateTime.now().add(const Duration(days: 14)),
      ),
    ];

    final progress = ProgressSnapshot(
      overallProgress: 62,
      entrepreneurshipProgress: 68,
      leadershipProgress: 57,
      coursesCompleted: 4,
      challengesCompleted: 2,
      assignmentsCompleted: 9,
      currentStreak: 6,
      skillsDeveloped: ['Customer analysis', 'Delegation', 'Cash-flow review'],
      upcomingMilestones: ['Business plan review', 'Leadership simulation', 'Monthly strategy check-in'],
      weeklyPerformance: {'Week 1': 80, 'Week 2': 72, 'Week 3': 68},
      personalGoals: ['Increase retention', 'Reduce CAC', 'Delegate marketing tasks'],
    );

    final businessPlan = BusinessPlan(
      businessIdea: 'Affordable digital growth agency for SMEs',
      problemStatement: 'Many small businesses struggle to acquire leads and maintain consistent sales systems.',
      targetMarket: 'SMEs in retail and service businesses across Nigeria',
      customerProfile: 'Founders with 2-20 employees and limited marketing capability',
      valueProposition: 'Simple growth systems that increase leads and make sales more predictable',
      competitorAnalysis: 'Competitors offer generic marketing services without clear implementation plans',
      productOrService: 'Growth strategy, funnel setup, sales process design, and marketing execution support',
      pricing: 'Project-based retainer from ₦150,000 monthly',
      marketingStrategy: 'LinkedIn content, partnerships, referrals, targeted cold outreach',
      salesStrategy: 'Discovery call, proposal, onboarding, onboarding checklist',
      operations: 'Remote team with structured weekly client reviews',
      staffing: 'Founder + content marketer + sales support + virtual assistant',
      startupCosts: '₦1.5M for branding, website, tools, and initial outreach',
      revenueProjection: '₦8M annual revenue in year one',
      cashFlowPlan: 'Monthly budget tracking, 90-day cash forecast, reserve for staffing',
      risks: 'Client acquisition uncertainty and delayed payments',
      growthStrategy: 'Expand into regional niches and create packaged retainers',
    );

    final leadershipPlan = LeadershipPlan(
      skillGoals: [
        LeadershipSkillGoal(
          skill: 'Delegation',
          currentLevel: 'Developing',
          targetLevel: 'Strong',
          practice: 'Delegate one clearly defined responsibility this week.',
          measurement: 'Was the task completed without unnecessary intervention?',
        ),
        LeadershipSkillGoal(
          skill: 'Communication',
          currentLevel: 'Developing',
          targetLevel: 'Strong',
          practice: 'Hold one weekly team update with clear expectations and KPIs.',
          measurement: 'Did the team understand priorities and responsibilities?',
        ),
        LeadershipSkillGoal(
          skill: 'Decision-making',
          currentLevel: 'Developing',
          targetLevel: 'Strong',
          practice: 'Use a 3-step decision framework for one important business choice.',
          measurement: 'Was the decision timely, informed, and documented?',
        ),
      ],
    );

    state = state.copyWith(
      profile: profile,
      plan: plan,
      dailyFocus: dailyFocus,
      weeklyChallenges: weeklyChallenges,
      progress: progress,
      businessPlan: businessPlan,
      leadershipPlan: leadershipPlan,
    );
  }
}

final coachingProvider = StateNotifierProvider<CoachingNotifier, CoachingState>((ref) {
  return CoachingNotifier()..loadDemoData();
});
