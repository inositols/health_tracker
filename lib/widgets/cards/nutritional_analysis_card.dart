import 'package:flutter/material.dart';
import 'package:assignment/widgets/common/liquid_glass_card.dart';

class NutritionalAnalysisCard extends StatelessWidget {
  const NutritionalAnalysisCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LiquidGlassCard(
      showDottedBorder: true,
      borderColor: Colors.orangeAccent.withOpacity(0.8),

      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.bolt, color: Color(0xFFFF6B35), size: 20),
              SizedBox(width: 8),
              Text(
                "Today’s Nutritional Analysis",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          LiquidGlassCard(child: _AnalysisText()),
        ],
      ),
    );
  }
}

class _AnalysisText extends StatelessWidget {
  const _AnalysisText();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: "You haven't eaten any ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: "iron",
            style: TextStyle(
              color: Color(0xFFFF6B35),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: " today. Consider adding ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: "beans",
            style: TextStyle(
              color: Color(0xFFFF6B35),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: " to your dinner.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
