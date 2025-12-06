import 'portfolio_ui_item.dart';
import 'chart_period_data.dart';
import 'chart_period.dart';

class PortfolioChart extends PortfolioUIItem {
  final Map<ChartPeriod, ChartPeriodData> periods;

  const PortfolioChart({
    required this.periods,
  });

  @override
  List<Object?> get props => [periods];
}
