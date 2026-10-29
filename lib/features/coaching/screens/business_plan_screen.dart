import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/coaching_provider.dart';

class BusinessPlanScreen extends ConsumerWidget {
  const BusinessPlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final businessPlan = ref.watch(coachingProvider).businessPlan;

    if (businessPlan == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final planFields = [
      _PlanSection('Business idea', businessPlan.businessIdea),
      _PlanSection('Problem statement', businessPlan.problemStatement),
      _PlanSection('Target market', businessPlan.targetMarket),
      _PlanSection('Customer profile', businessPlan.customerProfile),
      _PlanSection('Value proposition', businessPlan.valueProposition),
      _PlanSection('Competitor analysis', businessPlan.competitorAnalysis),
      _PlanSection('Product/service', businessPlan.productOrService),
      _PlanSection('Pricing', businessPlan.pricing),
      _PlanSection('Marketing strategy', businessPlan.marketingStrategy),
      _PlanSection('Sales strategy', businessPlan.salesStrategy),
      _PlanSection('Operations', businessPlan.operations),
      _PlanSection('Staffing', businessPlan.staffing),
      _PlanSection('Startup costs', businessPlan.startupCosts),
      _PlanSection('Revenue projections', businessPlan.revenueProjection),
      _PlanSection('Cash-flow plan', businessPlan.cashFlowPlan),
      _PlanSection('Risks', businessPlan.risks),
      _PlanSection('Growth strategy', businessPlan.growthStrategy),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Business Plan Coach')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Business plan builder',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...planFields.map((section) => section).toList(),
        ],
      ),
    );
  }
}

class _PlanSection extends StatelessWidget {
  final String title;
  final String content;

  const _PlanSection(this.title, this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
    );
  }
}
