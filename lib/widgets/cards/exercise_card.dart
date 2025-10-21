import 'package:assignment/widgets/cards/groceries_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:assignment/widgets/common/liquid_glass_card.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LiquidGlassCard(
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              spacing: 16,
              children: [
                const Text(
                  'Exercise',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),

                Image.asset('assets/svg/weight.png', fit: BoxFit.scaleDown),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.55,
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _Calories(),
                Button(text: "Logging an Exercise"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Calories extends StatelessWidget {
  const _Calories();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: LiquidGlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  Icons.local_fire_department,
                  color: Color(0xFFFF6B35),
                  size: 20,
                ),
                SizedBox(width: 4),
                Text(
                  '551 kcal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              'Calories Burnt Today',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
