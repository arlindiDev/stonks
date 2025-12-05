import 'package:grpc/grpc.dart';
import '../../../../core/grpc/grpc_channel_factory.dart';
import '../../../../core/grpc/server_factory.dart';
import '../generated/portfolio.pbgrpc.dart';
import 'portfolio_service.dart' as service;

class PortfolioGrpcClient {
  late final PortfolioServiceClient _client;
  final Server? _mockServer;

  PortfolioGrpcClient._({
    required PortfolioServiceClient client,
    Server? mockServer,
  })  : _client = client,
        _mockServer = mockServer;

  static Future<PortfolioGrpcClient> createMockClient() async {
    final (server, port) = await ServerFactory.createAndStartServer(
      [service.PortfolioService()],
    );

    final channel = GrpcChannelFactory.createLocalChannel(port);
    final client = PortfolioServiceClient(channel);

    return PortfolioGrpcClient._(
      client: client,
      mockServer: server,
    );
  }

  static PortfolioGrpcClient createClient({
    required String host,
    required int port,
    ChannelCredentials? credentials,
  }) {
    final channel = GrpcChannelFactory.createChannel(
      host: host,
      port: port,
      credentials: credentials,
    );

    final client = PortfolioServiceClient(channel);

    return PortfolioGrpcClient._(
      client: client,
    );
  }

  Future<GetPortfolioResponse> getPortfolio({String? userId}) {
    final request = GetPortfolioRequest();
    if (userId != null) {
      request.userId = userId;
    }
    return _client.getPortfolio(request);
  }

  Future<void> close() async {
    await _mockServer?.shutdown();
  }
}
