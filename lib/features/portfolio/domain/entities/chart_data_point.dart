import 'package:equatable/equatable.dart';

class ChartDataPoint extends Equatable {
  final double value;
  final DateTime timestamp;
  final double percentChange;

  const ChartDataPoint({
    required this.value,
    required this.timestamp,
    required this.percentChange,
  });

  @override
  List<Object?> get props => [value, timestamp, percentChange];
}
