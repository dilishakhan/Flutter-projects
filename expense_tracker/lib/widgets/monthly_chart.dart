import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MonthlyChart extends StatelessWidget {
  final Map<String, double> monthlyData;

  const MonthlyChart({super.key, required this.monthlyData});

  String formatMonth(String month) {
    final parts = month.split('-');

    final monthNames = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final year = parts[0].substring(2);

    final monthName = monthNames[int.parse(parts[1])];

    return "$monthName/$year";
  }

  @override
  Widget build(BuildContext context) {
    final months = monthlyData.keys.toList();
    final values = monthlyData.values.toList();

    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 3,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            const Text(
              "Monthly Expenses",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 280,

              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,

                  gridData: FlGridData(show: true, drawVerticalLine: false),

                  borderData: FlBorderData(show: false),

                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),

                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),

                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 45,

                        getTitlesWidget: (value, meta) {
                          return Text(
                            value >= 1000
                                ? "${(value / 1000).toStringAsFixed(0)}K"
                                : value.toInt().toString(),
                            style: const TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),

                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,

                        getTitlesWidget: (value, meta) {
                          if (value.toInt() < months.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),

                              child: Text(
                                formatMonth(months[value.toInt()]),

                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }

                          return const SizedBox();
                        },
                      ),
                    ),
                  ),

                  barGroups: List.generate(months.length, (index) {
                    return BarChartGroupData(
                      x: index,

                      barRods: [
                        BarChartRodData(
                          toY: values[index],

                          width: 28,

                          borderRadius: BorderRadius.circular(10),

                          gradient: const LinearGradient(
                            colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
