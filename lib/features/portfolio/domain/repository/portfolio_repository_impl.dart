import '../../data/datasource/portfolio_remote_datasource.dart';
import '../../data/mappers/portfolio_mapper.dart';
import '../entities/portfolio_ui_item.dart';
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
      // TODO: Return a proper Failure object (Either<Failure, Success> pattern)
      rethrow;
    }
  }
}
