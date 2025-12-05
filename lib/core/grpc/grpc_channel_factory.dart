import 'package:grpc/grpc.dart';

/// Factory for creating gRPC channels
/// Shared utility used by all feature gRPC clients
class GrpcChannelFactory {
  /// Create a channel to connect to a gRPC server
  static ClientChannel createChannel({
    required String host,
    required int port,
    ChannelCredentials? credentials,
  }) {
    return ClientChannel(
      host,
      port: port,
      options: ChannelOptions(
        credentials: credentials ?? const ChannelCredentials.insecure(),
      ),
    );
  }

  /// Create a channel to localhost (for mock servers)
  static ClientChannel createLocalChannel(int port) {
    return createChannel(
      host: 'localhost',
      port: port,
      credentials: const ChannelCredentials.insecure(),
    );
  }
}
