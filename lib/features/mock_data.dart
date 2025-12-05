class PortfolioUIItem { }

class ChartPeriodData {
  final List<double> values;
  final double latestPrice;
  final double unrealizedPL;
  final double unrealizedPLPercent;

  ChartPeriodData({
    required this.values,
    required this.latestPrice,
    required this.unrealizedPL,
    required this.unrealizedPLPercent,
  });
}

class PortfolioChart extends PortfolioUIItem {
  final Map<String, ChartPeriodData> periods;

  PortfolioChart({
    required this.periods,
  });
}

class PortfolioTotal extends PortfolioUIItem {
  final double totalValue;

  PortfolioTotal({
    required this.totalValue,
  });
}

class PortfolioItem extends PortfolioUIItem {
  final String ticker;
  final double position;
  final double avgPrice;
  final double currentPrice;
  final double marketValue;
  final double portfolioPercent;
  final double unrealizedPL;
  final double unrealizedPLPercent;

  PortfolioItem({
    required this.ticker,
    required this.position,
    required this.avgPrice,
    required this.currentPrice,
    required this.marketValue,
    required this.portfolioPercent,
    required this.unrealizedPL,
    required this.unrealizedPLPercent,
  });
}

List<PortfolioUIItem> getMockPortfolioData() {
  return [
    PortfolioChart(
      periods: {
        '1D': ChartPeriodData(
          values: [126800, 126900, 127000, 126850, 127100, 127200, 127150, 127300, 127250, 127400, 127350, 127439.25],
          latestPrice: 127439.25,
          unrealizedPL: 639.25,
          unrealizedPLPercent: 0.50,
        ),
        '1W': ChartPeriodData(
          values: [125000, 125500, 126000, 126200, 126800, 127100, 127439.25],
          latestPrice: 127439.25,
          unrealizedPL: 2439.25,
          unrealizedPLPercent: 1.95,
        ),
        '1M': ChartPeriodData(
          values: [120000, 121000, 122500, 123000, 124500, 125000, 126000, 127000, 127439.25],
          latestPrice: 127439.25,
          unrealizedPL: 7439.25,
          unrealizedPLPercent: 6.20,
        ),
        '6M': ChartPeriodData(
          values: [110000, 112000, 115000, 117000, 119000, 121000, 123000, 125000, 127439.25],
          latestPrice: 127439.25,
          unrealizedPL: 17439.25,
          unrealizedPLPercent: 15.85,
        ),
        'YTD': ChartPeriodData(
          values: [105000, 108000, 111000, 114000, 117000, 120000, 123000, 125000, 127439.25],
          latestPrice: 127439.25,
          unrealizedPL: 22439.25,
          unrealizedPLPercent: 21.37,
        ),
        '1Y': ChartPeriodData(
          values: [100000, 103000, 106000, 109000, 112000, 115000, 118000, 121000, 124000, 127439.25],
          latestPrice: 127439.25,
          unrealizedPL: 27439.25,
          unrealizedPLPercent: 27.44,
        ),
        '5Y': ChartPeriodData(
          values: [50000, 60000, 70000, 80000, 90000, 100000, 110000, 120000, 127439.25],
          latestPrice: 127439.25,
          unrealizedPL: 77439.25,
          unrealizedPLPercent: 154.88,
        ),
        'ALL': ChartPeriodData(
          values: [25000, 35000, 45000, 55000, 70000, 85000, 100000, 115000, 127439.25],
          latestPrice: 127439.25,
          unrealizedPL: 102439.25,
          unrealizedPLPercent: 409.76,
        ),
      },
    ),
    PortfolioTotal(
      totalValue: 127439.25,
    ),
    PortfolioItem(
      ticker: 'AAPL',
      position: 50,
      avgPrice: 150.25,
      currentPrice: 195.50,
      marketValue: 9775.00,
      portfolioPercent: 15.25,
      unrealizedPL: 2262.50,
      unrealizedPLPercent: 30.12,
    ),
    PortfolioItem(
      ticker: 'GOOGL',
      position: 30,
      avgPrice: 125.80,
      currentPrice: 140.25,
      marketValue: 4207.50,
      portfolioPercent: 6.56,
      unrealizedPL: 433.50,
      unrealizedPLPercent: 11.48,
    ),
    PortfolioItem(
      ticker: 'BRK.B',
      position: 25,
      avgPrice: 340.50,
      currentPrice: 385.75,
      marketValue: 9643.75,
      portfolioPercent: 15.04,
      unrealizedPL: 1131.25,
      unrealizedPLPercent: 13.29,
    ),
    PortfolioItem(
      ticker: 'NVDA',
      position: 100,
      avgPrice: 420.00,
      currentPrice: 495.20,
      marketValue: 49520.00,
      portfolioPercent: 77.23,
      unrealizedPL: 7520.00,
      unrealizedPLPercent: 17.90,
    ),
    PortfolioItem(
      ticker: 'VOO',
      position: 75,
      avgPrice: 380.25,
      currentPrice: 425.80,
      marketValue: 31935.00,
      portfolioPercent: 49.81,
      unrealizedPL: 3416.25,
      unrealizedPLPercent: 11.98,
    ),
    PortfolioItem(
      ticker: 'DXYZ',
      position: 200,
      avgPrice: 45.50,
      currentPrice: 38.20,
      marketValue: 7640.00,
      portfolioPercent: 11.91,
      unrealizedPL: -1460.00,
      unrealizedPLPercent: -16.04,
    ),
    PortfolioItem(
      ticker: 'VTI',
      position: 60,
      avgPrice: 210.00,
      currentPrice: 245.30,
      marketValue: 14718.00,
      portfolioPercent: 22.95,
      unrealizedPL: 2118.00,
      unrealizedPLPercent: 16.81,
    ),
  ];
}
