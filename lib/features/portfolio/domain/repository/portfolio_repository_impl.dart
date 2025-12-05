import '../../data/datasource/portfolio_remote_datasource.dart';
import '../../data/mappers/portfolio_mapper.dart';
import '../../data/mock_data.dart';
import 'portfolio_repository.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioRemoteDataSource _remoteDataSource;

  PortfolioRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<PortfolioUIItem>> getPortfolioData() async {
    try {
      final response = await _remoteDataSource.getPortfolio();
      
      return PortfolioMapper.fromProtoResponse(response);
    } catch (e) {
      // need to return a proper Failure, with a wrapper object
      rethrow;
    }
  }
}
