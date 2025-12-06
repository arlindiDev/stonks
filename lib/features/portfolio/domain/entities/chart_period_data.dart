import 'package:equatable/equatable.dart';
import 'chart_data_point.dart';

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
