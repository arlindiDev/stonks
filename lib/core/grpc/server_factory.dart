import 'package:grpc/grpc.dart';

/// Factory for creating gRPC servers
/// Shared utility used by all feature mock services
class ServerFactory {
  /// Standard codec registry for all mock servers
  static final CodecRegistry standardCodecRegistry = CodecRegistry(
    codecs: const [GzipCodec(), IdentityCodec()],
  );

  /// Create and start a mock gRPC server on a random port
  /// Returns a tuple of (server, port)
  static Future<(Server, int)> createAndStartServer(
    List<Service> services,
  ) async {
    final server = Server.create(
      services: services,
      codecRegistry: standardCodecRegistry,
    );

    // Start on random port (port: 0)
    await server.serve(port: 0);
    final port = server.port!;

    return (server, port);
  }
}
