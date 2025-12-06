import 'portfolio_ui_item.dart';
import 'chart_period_data.dart';
import 'chart_period.dart';

class PortfolioChart extends PortfolioUIItem {
  final Map<ChartPeriod, ChartPeriodData> periods;

  PortfolioChart({
    required this.periods,
  });
}
