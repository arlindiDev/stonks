import 'package:stocks/features/portfolio/domain/entities/chart_data_point.dart';
import 'package:stocks/features/portfolio/domain/entities/chart_period.dart';
import 'package:stocks/features/portfolio/domain/entities/chart_period_data.dart';
import 'package:stocks/features/portfolio/domain/entities/portfolio_chart.dart';
import 'package:stocks/features/portfolio/domain/entities/portfolio_item.dart';
import 'package:stocks/features/portfolio/domain/entities/portfolio_ui_item.dart';

class TestData {
  static PortfolioItem createPortfolioItem({
    String ticker = 'AAPL',
    double position = 100.0,
    double avgPrice = 150.0,
    double currentPrice = 175.0,
    double marketValue = 17500.0,
    double portfolioPercent = 14.0,
    double unrealizedPL = 2500.0,
    double unrealizedPLPercent = 16.67,
  }) {
    return PortfolioItem(
      ticker: ticker,
      position: position,
      avgPrice: avgPrice,
      currentPrice: currentPrice,
      marketValue: marketValue,
      portfolioPercent: portfolioPercent,
      unrealizedPL: unrealizedPL,
      unrealizedPLPercent: unrealizedPLPercent,
    );
  }

  static ChartDataPoint createChartDataPoint({
    double value = 125000.0,
    DateTime? timestamp,
    double percentChange = 2.5,
  }) {
    return ChartDataPoint(
      value: value,
      timestamp: timestamp ?? DateTime(2024, 1, 1, 9, 30),
      percentChange: percentChange,
    );
  }

  static ChartPeriodData createChartPeriodData({
    List<ChartDataPoint>? dataPoints,
    double latestPrice = 125000.0,
    double unrealizedPL = 3125.0,
    double unrealizedPLPercent = 2.56,
  }) {
    return ChartPeriodData(
      dataPoints: dataPoints ?? [
        createChartDataPoint(value: 121875.0, percentChange: 0.0),
        createChartDataPoint(value: 123000.0, percentChange: 0.92),
        createChartDataPoint(value: 125000.0, percentChange: 2.56),
      ],
      latestPrice: latestPrice,
      unrealizedPL: unrealizedPL,
      unrealizedPLPercent: unrealizedPLPercent,
    );
  }

  static PortfolioChart createPortfolioChart({
    Map<ChartPeriod, ChartPeriodData>? periods,
  }) {
    return PortfolioChart(
      periods: periods ?? {
        ChartPeriod.oneDay: createChartPeriodData(),
        ChartPeriod.oneWeek: createChartPeriodData(unrealizedPL: 5000, unrealizedPLPercent: 4.17),
        ChartPeriod.oneMonth: createChartPeriodData(unrealizedPL: 7500, unrealizedPLPercent: 6.38),
      },
    );
  }

  static List<PortfolioUIItem> createFullPortfolioData() {
    return [
      createPortfolioChart(),
      createPortfolioItem(ticker: 'AAPL'),
      createPortfolioItem(
        ticker: 'GOOGL',
        position: 50.0,
        avgPrice: 140.0,
        currentPrice: 155.0,
        marketValue: 7750.0,
        portfolioPercent: 6.2,
        unrealizedPL: 750.0,
        unrealizedPLPercent: 10.71,
      ),
      createPortfolioItem(
        ticker: 'MSFT',
        position: 75.0,
        avgPrice: 380.0,
        currentPrice: 375.0,
        marketValue: 28125.0,
        portfolioPercent: 22.5,
        unrealizedPL: -375.0,
        unrealizedPLPercent: -1.32,
      ),
    ];
  }
}

