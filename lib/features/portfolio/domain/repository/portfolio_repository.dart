import '../../data/mock_data.dart';

abstract class PortfolioRepository {
  Future<List<PortfolioUIItem>> getPortfolioData();
}
