import '../../data/mock_data.dart';
import 'portfolio_repository.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  @override
  Future<List<PortfolioUIItem>> getPortfolioData() async {
    return getMockPortfolioData();
  }
}
