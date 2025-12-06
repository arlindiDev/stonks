import 'portfolio_ui_item.dart';

/// Represents a single stock position in the portfolio
class PortfolioItem extends PortfolioUIItem {
  final String ticker;
  final String companyName;
  final double position;
  final double avgPrice;
  final double currentPrice;
  final double dayChangePercent;
  final double marketValue;
  final double portfolioPercent;
  final double unrealizedPL;
  final double unrealizedPLPercent;

  const PortfolioItem({
    required this.ticker,
    required this.companyName,
    required this.position,
    required this.avgPrice,
    required this.currentPrice,
    required this.dayChangePercent,
    required this.marketValue,
    required this.portfolioPercent,
    required this.unrealizedPL,
    required this.unrealizedPLPercent,
  });

  @override
  List<Object?> get props => [
        ticker,
        companyName,
        position,
        avgPrice,
        currentPrice,
        dayChangePercent,
        marketValue,
        portfolioPercent,
        unrealizedPL,
        unrealizedPLPercent,
      ];
}
