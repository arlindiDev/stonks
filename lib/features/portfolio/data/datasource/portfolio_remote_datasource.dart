import '../grpc/portfolio_grpc_client.dart';
import '../generated/portfolio.pb.dart' as proto;

abstract class PortfolioRemoteDataSource {
  Future<proto.GetPortfolioResponse> getPortfolio({String? userId});
}

class PortfolioRemoteDataSourceImpl implements PortfolioRemoteDataSource {
  final PortfolioGrpcClient _grpcClient;

  PortfolioRemoteDataSourceImpl(this._grpcClient);

  @override
  Future<proto.GetPortfolioResponse> getPortfolio({String? userId}) {
    return _grpcClient.getPortfolio(userId: userId);
  }
}
