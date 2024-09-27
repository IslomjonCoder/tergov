import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../../../utils/constants/colors.dart';

class LineChartGraphWidget extends StatelessWidget {
  final List<FlSpot> dataPoints;
  final List<String> xLabels;
  final double maxYValue;

  const LineChartGraphWidget({
    super.key,
    required this.dataPoints,
    required this.xLabels,
    this.maxYValue = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: true, drawVerticalLine: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const style = TextStyle(
                    color: TColors.textA3A,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  );
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text('${value.toInt()}h', style: style),
                  );
                },
                reservedSize: 35,
                interval: 5,
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 50,
                interval: 1,
              ),
            ),
            rightTitles: const AxisTitles(),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const style = TextStyle(
                    color: TColors.text2B3,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  );
                  if (value.toInt() >= 0 && value.toInt() < xLabels.length) {
                    return SideTitleWidget(
                      space: 5,
                      axisSide: meta.axisSide,
                      child: Text(xLabels[value.toInt()], style: style),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
                reservedSize: 40,
                interval: 1,
              ),
            ),
          ),
          borderData: FlBorderData(
            border: Border.all(color: TColors.grey, width: 1),
            show: false,
          ),
          minX: 0,
          maxX: dataPoints.length - 1.toDouble(),
          minY: 0,
          maxY: maxYValue,
          lineBarsData: [
            LineChartBarData(
              spots: dataPoints,
              isCurved: true,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              color: TColors.color717,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    TColors.color717.withOpacity(0.5),
                    TColors.color717.withOpacity(0.4),
                    TColors.color717.withOpacity(0.3),
                    TColors.color717.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
