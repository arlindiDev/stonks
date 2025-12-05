import 'portfolio_ui_item.dart';

/// Represents a single stock position in the portfolio
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
