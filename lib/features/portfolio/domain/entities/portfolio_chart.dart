import 'portfolio_ui_item.dart';
import 'chart_period_data.dart';

/// Represents the portfolio chart with data for multiple time periods
class PortfolioChart extends PortfolioUIItem {
  final Map<String, ChartPeriodData> periods;

  PortfolioChart({
    required this.periods,
  });
}
