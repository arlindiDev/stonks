import 'package:grpc/service_api.dart';
import '../generated/portfolio.pbgrpc.dart';
import '../generated/portfolio.pb.dart' as proto;
import '../mock_data_helper.dart';

/// Portfolio gRPC service implementation that returns hardcoded proto messages
class PortfolioService extends PortfolioServiceBase {
  @override
  Future<proto.GetPortfolioResponse> getPortfolio(
    ServiceCall call,
    proto.GetPortfolioRequest request,
  ) async {
    return MockDataHelper.getMockPortfolioResponse();
  }
}
