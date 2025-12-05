class PortfolioItem {
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

List<PortfolioItem> getMockPortfolioData() {
  return [
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