import 'package:flutter/material.dart';
import 'package:assignment/widgets/common/liquid_glass_card.dart';

class NutritionOverviewCard extends StatelessWidget {
  const NutritionOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LiquidGlassCard(
      child: SizedBox(
        height: 265,
        child: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Nutrition Overview',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Calories & macros',
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                    ],
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.info_outline,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 120,
              child: Row(
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1250',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Eaten',
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Stack(
                      children: [
                        // Progress arc only (no background circle)
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: CustomPaint(
                            painter: _ProgressArcPainter(progress: 0.6),
                          ),
                        ),
                        // Text and icon positioned inside the arc area
                        Positioned(
                          top: 10, // Position within the upper part of the arc
                          left: 0,
                          right: 0,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                color: Color(0xFFFF6B35),
                                size: 24,
                              ),
                              SizedBox(height: 2),
                              Text(
                                '1503',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Remaining',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '3200',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Goal',
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.1),
              height: 5,
              thickness: 1,
            ),
            Expanded(
              child: Row(
                children: const [
                  Expanded(
                    child: _Macro(
                      icon: Icons.restaurant,
                      label: 'Protein',
                      current: 145,
                      goal: 180,
                      color: Colors.pink,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _Macro(
                      icon: Icons.eco,
                      label: 'Carbs',
                      current: 135,
                      goal: 210,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _Macro(
                      icon: Icons.water_drop,
                      label: 'Fats',
                      current: 55,
                      goal: 90,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressArcPainter extends CustomPainter {
  final double progress;

  const _ProgressArcPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - 8) / 2;

    // Background arc (incomplete circle)
    final backgroundPaint = Paint()
      ..color = Colors.grey[800]!
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Progress arc (orange)
    final progressPaint = Paint()
      ..color = const Color(0xFFFF6B35)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw background arc (180 degrees semicircle)
    const startAngle = 3.14159; // 180 degrees (left side)
    const backgroundSweepAngle = 3.14159; // 180 degrees (semicircle)

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      backgroundSweepAngle,
      false,
      backgroundPaint,
    );

    // Draw progress arc (colored part on the left)
    final progressSweepAngle = backgroundSweepAngle * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      progressSweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _Macro extends StatelessWidget {
  final IconData icon;
  final String label;
  final int current;
  final int goal;
  final Color color;
  const _Macro({
    required this.icon,
    required this.label,
    required this.current,
    required this.goal,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final progress = current / goal;
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.white70),
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          minHeight: 6,
          value: progress,
          backgroundColor: Colors.grey[800],
          valueColor: AlwaysStoppedAnimation<Color>(color),
          borderRadius: BorderRadius.circular(3),
        ),
        const SizedBox(height: 2),
        Text(
          '$current / ${goal}g',
          style: const TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
