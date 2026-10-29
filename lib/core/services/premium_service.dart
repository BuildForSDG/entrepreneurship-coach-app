enum CoachingAccess { free, premium }

class PremiumService {
  CoachingAccess access = CoachingAccess.free;

  bool canAccess(String featureKey) {
    final premiumFeatures = {
      'advanced_ai_coaching',
      'business_plan_review',
      'leadership_simulations',
      'weekly_strategy_sessions',
      'download_reports',
      'team_coaching',
      'industry_specific_programs',
    };

    if (premiumFeatures.contains(featureKey)) {
      return access == CoachingAccess.premium;
    }

    return true;
  }
}
