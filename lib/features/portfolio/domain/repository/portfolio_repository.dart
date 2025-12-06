import 'portfolio_result.dart';

abstract class PortfolioRepository {
  Future<PortfolioResult> getPortfolioData();
}
