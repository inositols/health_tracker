import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:assignment/widgets/common/liquid_glass_card.dart';

class WeightProgressCard extends StatelessWidget {
  const WeightProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LiquidGlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Weight Progress',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 220,
            child: LineChart(
              LineChartData(
                baselineX: 0,
                baselineY: 0,
                minY: 69.8,
                maxY: 72.2,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.white.withOpacity(0.25),
                    strokeWidth: 1,
                    dashArray: const [8, 8],
                  ),
                  checkToShowHorizontalLine: (value) =>
                      value == 0 || value == 70 || value == 71 || value == 72,
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1, // Only show 70, 71, 72
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        if (value == 0 ||
                            value == 70 ||
                            value == 71 ||
                            value == 72) {
                          return Text(
                            '${value.toInt()}k',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        const days = ['M', 'T', 'W', 'Th', 'F', 'S', 'S'];
                        if (value >= 0 && value < days.length) {
                          return Text(
                            days[value.toInt()],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 70.2),
                      FlSpot(1, 71.0),
                      FlSpot(2, 71.0),
                      FlSpot(3, 70.3),
                      FlSpot(4, 70.3),
                      FlSpot(5, 70.7),
                      FlSpot(6, 70.7),
                      FlSpot(7, 70.0),

                      // FlSpot(8, 70.0),
                    ],
                    isCurved: true,
                    color: const Color(0xFFFF6B35),
                    barWidth: 2,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFFFF6B35).withOpacity(0.35),
                          Color(0xFF0D0D0D),
                        ],
                      ),
                    ),
                    dotData: const FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const _WeightSummaryBar(),
        ],
      ),
    );
  }
}

class _WeightSummaryBar extends StatelessWidget {
  const _WeightSummaryBar();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.35),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withOpacity(0.15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: const [
            Expanded(
              child: _SummaryCell(
                title: '7 days',
                value: '+ 0.35kg',
                valueColor: Colors.red,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _SummaryCell(
                title: '30 days',
                value: '- 2.1kg',
                valueColor: Colors.green,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _SummaryCell(
                title: '90 days',
                value: '- 3.5kg',
                valueColor: Colors.green,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _SummaryCell(
                title: '120 days',
                value: '- 9.2kg',
                valueColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCell extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;
  const _SummaryCell({
    required this.title,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            color: valueColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
