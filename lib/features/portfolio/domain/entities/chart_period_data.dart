import 'package:equatable/equatable.dart';
import 'chart_data_point.dart';

/// Represents chart data for a specific time period (1D, 1W, 1M, etc.)
class ChartPeriodData extends Equatable {
  final List<ChartDataPoint> dataPoints;
  final double latestPrice;
  final double unrealizedPL;
  final double unrealizedPLPercent;
  final double minValue;
  final double maxValue;

  const ChartPeriodData({
    required this.dataPoints,
    required this.latestPrice,
    required this.unrealizedPL,
    required this.unrealizedPLPercent,
    required this.minValue,
    required this.maxValue,
  });

  @override
  List<Object?> get props => [
        dataPoints,
        latestPrice,
        unrealizedPL,
        unrealizedPLPercent,
        minValue,
        maxValue,
      ];
}
