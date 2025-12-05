import '../entities/portfolio_ui_item.dart';

abstract class PortfolioRepository {
  Future<List<PortfolioUIItem>> getPortfolioData();
}
