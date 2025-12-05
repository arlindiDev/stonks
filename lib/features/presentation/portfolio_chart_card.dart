import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../mock_data.dart';
import '../utils/formatters.dart';

class PortfolioChartCard extends StatefulWidget {
  final PortfolioChart chart;

  const PortfolioChartCard({
    super.key,
    required this.chart,
  });

  @override
  State<PortfolioChartCard> createState() => _PortfolioChartCardState();
}

class _PortfolioChartCardState extends State<PortfolioChartCard> {
  String selectedPeriod = '1D';

  @override
  Widget build(BuildContext context) {
    final periodData = widget.chart.periods[selectedPeriod]!;
    final isPositive = periodData.unrealizedPL >= 0;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Price and P&L info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Formatters.currency(periodData.latestPrice),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${Formatters.currencyWithSign(periodData.unrealizedPL)} (${Formatters.percentWithSign(periodData.unrealizedPLPercent)})',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isPositive ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Line Chart
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: (periodData.values.length - 1).toDouble(),
                  minY: periodData.values.reduce((a, b) => a < b ? a : b) * 0.98,
                  maxY: periodData.values.reduce((a, b) => a > b ? a : b) * 1.02,
                  lineBarsData: [
                    LineChartBarData(
                      spots: periodData.values.asMap().entries.map((entry) {
                        return FlSpot(entry.key.toDouble(), entry.value);
                      }).toList(),
                      isCurved: true,
                      color: isPositive ? Colors.green : Colors.red,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: (isPositive ? Colors.green : Colors.red).withOpacity(0.1),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(enabled: false),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Period tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widget.chart.periods.keys.map((period) {
                final isSelected = period == selectedPeriod;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPeriod = period;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          period,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
