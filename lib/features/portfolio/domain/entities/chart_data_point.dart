/// Represents a single data point on the portfolio chart
class ChartDataPoint {
  final double value;
  final DateTime timestamp;
  final double percentChange;

  ChartDataPoint({
    required this.value,
    required this.timestamp,
    required this.percentChange,
  });
}
