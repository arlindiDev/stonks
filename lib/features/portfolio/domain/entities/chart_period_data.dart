import 'chart_data_point.dart';

/// Represents chart data for a specific time period (1D, 1W, 1M, etc.)
class ChartPeriodData {
  final List<ChartDataPoint> dataPoints;
  final double latestPrice;
  final double unrealizedPL;
  final double unrealizedPLPercent;
  final double minValue;
  final double maxValue;

  ChartPeriodData({
    required this.dataPoints,
    required this.latestPrice,
    required this.unrealizedPL,
    required this.unrealizedPLPercent,
    required this.minValue,
    required this.maxValue,
  });
}
