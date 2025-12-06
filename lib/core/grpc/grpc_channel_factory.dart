import 'package:grpc/grpc.dart';

/// Factory for creating gRPC channels
/// Shared utility used by all feature gRPC clients
class GrpcChannelFactory {
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

  static ClientChannel createLocalChannel(int port) {
    return createChannel(
      host: 'localhost',
      port: port,
      credentials: const ChannelCredentials.insecure(),
    );
  }
}
