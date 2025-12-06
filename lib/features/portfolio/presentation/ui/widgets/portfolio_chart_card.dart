import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../theme/presentation/state/theme_bloc.dart';
import '../../../../theme/presentation/state/theme_state.dart';
import '../../../domain/entities/portfolio_chart.dart';
import '../../../domain/entities/chart_period_data.dart';
import '../../../domain/entities/chart_period.dart';
import '../../../../utils/formatters.dart';

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
  ChartPeriod selectedPeriod = ChartPeriod.oneDay;
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    final periodData = widget.chart.periods[selectedPeriod]!;
    final isPositive = periodData.unrealizedPL >= 0;
    
    final touchedDataPoint = touchedIndex != null 
        ? periodData.dataPoints[touchedIndex!] 
        : null;
    
    final displayValue = touchedDataPoint?.value ?? periodData.latestPrice;
    final displayPercent = touchedDataPoint?.percentChange ?? periodData.unrealizedPLPercent;
    final displayPL = touchedDataPoint != null && touchedIndex! > 0
        ? touchedDataPoint.value - periodData.dataPoints[0].value
        : periodData.unrealizedPL;
    final displayDate = touchedDataPoint?.timestamp;

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return _buildCard(context, themeState, periodData, isPositive, displayValue, displayPercent, displayPL, displayDate);
      },
    );
  }

  Widget _buildCard(
    BuildContext context,
    ThemeState themeState,
    ChartPeriodData periodData,
    bool isPositive,
    double displayValue,
    double displayPercent,
    double displayPL,
    DateTime? displayDate,
  ) {

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          Formatters.currency(displayValue),
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (displayDate != null) ...[
                          const SizedBox(width: 8),
                          Text(
                            Formatters.formatDate(displayDate, selectedPeriod.value),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: themeState.textSecondaryColor,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${Formatters.currencyWithSign(displayPL)} (${Formatters.percentWithSign(displayPercent)})',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: displayPL >= 0 ? themeState.positiveColor : themeState.negativeColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            SizedBox(
              height: 200,
              child: LineChart(
                duration: Duration.zero, // Disable animation
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 50,
                        getTitlesWidget: (value, meta) {
                          // Show labels at the top and bottom of the chart
                          if (value == meta.min || value == meta.max) {
                            final displayValue = value == meta.min ? periodData.minValue : periodData.maxValue;
                            return Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                Formatters.abbreviatedNumber(displayValue),
                                style: TextStyle(
                                  color: themeState.textSecondaryColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: (periodData.dataPoints.length - 1).toDouble(),
                  minY: periodData.minValue * 0.98,
                  maxY: periodData.maxValue * 1.02,
                  lineBarsData: [
                    LineChartBarData(
                      spots: periodData.dataPoints.asMap().entries.map((entry) {
                        return FlSpot(entry.key.toDouble(), entry.value.value);
                      }).toList(),
                      isCurved: true,
                      color: isPositive ? themeState.positiveColor : themeState.negativeColor,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          if (index == touchedIndex) {
                            return FlDotCirclePainter(
                              radius: 6,
                              color: Theme.of(context).colorScheme.surface,
                              strokeWidth: 3,
                              strokeColor: isPositive ? themeState.positiveColor : themeState.negativeColor,
                            );
                          }
                          return FlDotCirclePainter(
                            radius: 0,
                            color: Colors.transparent,
                          );
                        },
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: (isPositive ? themeState.positiveColor : themeState.negativeColor).withValues(alpha: 0.1),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    enabled: true,
                    touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
                      if (!event.isInterestedForInteractions ||
                          touchResponse == null ||
                          touchResponse.lineBarSpots == null) {
                        setState(() {
                          touchedIndex = null;
                        });
                        return;
                      }
                      setState(() {
                        touchedIndex = touchResponse.lineBarSpots!.first.spotIndex;
                      });
                    },
                    getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
                      return spotIndexes.map((index) {
                        return TouchedSpotIndicatorData(
                          FlLine(
                            color: (isPositive ? themeState.positiveColor : themeState.negativeColor).withValues(alpha: 0.5),
                            strokeWidth: 2,
                            dashArray: [5, 5],
                          ),
                          FlDotData(show: false),
                        );
                      }).toList();
                    },
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (touchedSpot) => Colors.transparent,
                      tooltipPadding: EdgeInsets.zero,
                      getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                        return [null];
                      },
                    ),
                  ),
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
                        touchedIndex = null;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? themeState.selectedTabColor : themeState.unselectedTabColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          period.value,
                          style: TextStyle(
                            color: isSelected ? themeState.selectedTabTextColor : themeState.unselectedTabTextColor,
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
