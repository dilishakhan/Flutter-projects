import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpenseChart extends StatelessWidget {
  final Map<String, double> categoryData;

  const ExpenseChart({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.purple,
      Colors.teal,
    ];

    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 3,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            const Text(
              "Expense Distribution",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 280,

              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 40,

                  sections: categoryData.entries
                      .toList()
                      .asMap()
                      .entries
                      .map(
                        (entry) => PieChartSectionData(
                          value: entry.value.value,

                          title: entry.value.value < 1000
                              ? ''
                              : entry.value.key,

                          radius: 90,

                          color: colors[entry.key % colors.length],

                          titleStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 12,
              runSpacing: 8,

              children: categoryData.entries
                  .toList()
                  .asMap()
                  .entries
                  .map(
                    (entry) => Row(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Container(
                          width: 12,
                          height: 12,

                          decoration: BoxDecoration(
                            color: colors[entry.key % colors.length],
                            shape: BoxShape.circle,
                          ),
                        ),

                        const SizedBox(width: 4),

                        Text(
                          "${entry.value.key}: ₹${entry.value.value.toStringAsFixed(0)}",
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
