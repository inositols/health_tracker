import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:assignment/widgets/common/liquid_glass_card.dart';

class StreakCard extends StatelessWidget {
  const StreakCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LiquidGlassCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _StreakTile(days: 37),
          SizedBox(width: 16),
          Expanded(child: _StreakDetails()),
        ],
      ),
    );
  }
}

class _StreakDetails extends StatelessWidget {
  const _StreakDetails();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Keep up the streak!',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Small wins today fuel big results tomorrow.',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 24),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: _StreakProgressWithLabels(completedCount: 3),
        ),
      ],
    );
  }
}

class _StreakTile extends StatelessWidget {
  final int days;
  const _StreakTile({required this.days});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.35),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 24,
                  offset: const Offset(0, 16),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFFF8C3A), Color(0xFFFF3D00)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Icon(
                    Icons.local_fire_department,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$days Days',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StreakProgressWithLabels extends StatelessWidget {
  final int completedCount;
  const _StreakProgressWithLabels({required this.completedCount});

  @override
  Widget build(BuildContext context) {
    const int total = 7;
    const Color active = Color(0xFFFF6B35);
    final Color inactive = Colors.white.withOpacity(0.12);
    const labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    Widget circle(bool done) => Container(
      padding: EdgeInsets.zero,
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: done ? active : inactive,
        shape: BoxShape.circle,
      ),
      child: done
          ? const Icon(Icons.check, color: Colors.white, size: 18)
          : null,
    );

    Widget connector(bool done) => Container(
      width: 12,
      height: 3,
      decoration: BoxDecoration(
        color: done ? active : inactive,
        borderRadius: BorderRadius.circular(1.5),
      ),
    );

    Widget dayItemWithConnector(int index) {
      final done = index < completedCount;
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The day item (circle + label)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              circle(done),
              const SizedBox(height: 6),
              Text(
                labels[index],
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),

          if (index < 2) ...[
            const SizedBox(width: 4),
            Transform.translate(
              offset: const Offset(0, 9),
              child: connector(index < completedCount - 1),
            ),
            const SizedBox(width: 4),
          ] else if (index > 1 && index < total - 1) ...[
            const SizedBox(width: 8),
          ],
        ],
      );
    }

    final List<Widget> children = [];
    for (int i = 0; i < total; i++) {
      children.add(dayItemWithConnector(i));
    }

    return Row(mainAxisSize: MainAxisSize.min, children: children);
  }
}
