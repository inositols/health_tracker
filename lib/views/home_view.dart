import 'dart:ui';
import 'package:assignment/widgets/cards/exercise_card.dart';
import 'package:assignment/widgets/cards/groceries_card.dart';
import 'package:assignment/widgets/cards/nutrition_overview_card.dart';
import 'package:assignment/widgets/cards/nutritional_analysis_card.dart';
import 'package:assignment/widgets/cards/streak_card.dart';
import 'package:assignment/widgets/cards/weight_progress_card.dart';
import 'package:flutter/material.dart';

class DashboardGlassUI extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const DashboardGlassUI({
    super.key,
    this.currentIndex = 0,
    this.onTap = _defaultOnTap,
  });

  static void _defaultOnTap(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0D0D0D),
              Color(0xFF0D0D0D),
              Color(0xFF1A0E05),
              Color(0xFF0D0D0D),
              Color(0xFF0D0D0D),
              Color(0xFF2A1508),
              Color(0xFF0D0D0D),
              Color(0xFF0D0D0D),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.mirror,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF0D0D0D),
                          Color(0xFF1A0E05),
                          Color(0xFF0D0D0D),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        tileMode: TileMode.mirror,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          // Handle menu button tap
                        },
                        child: const Center(
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Today's overview",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                NutritionOverviewCard(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF6B35),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                StreakCard(),
                WeightProgressCard(),
                NutritionalAnalysisCard(),
                ExerciseCard(),
                GroceriesCard(),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
