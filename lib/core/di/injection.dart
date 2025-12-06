import 'package:get_it/get_it.dart';
import '../../features/portfolio/data/datasource/portfolio_remote_datasource.dart';
import '../../features/portfolio/data/grpc/portfolio_grpc_client.dart';
import '../../features/portfolio/domain/repository/portfolio_repository.dart';
import '../../features/portfolio/domain/repository/portfolio_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt.registerSingletonAsync<PortfolioGrpcClient>(
    () async => await PortfolioGrpcClient.createMockClient(),
  );

  await getIt.isReady<PortfolioGrpcClient>();

  getIt.registerLazySingleton<PortfolioRemoteDataSource>(
    () => PortfolioRemoteDataSourceImpl(getIt<PortfolioGrpcClient>()),
  );

  getIt.registerLazySingleton<PortfolioRepository>(
    () => PortfolioRepositoryImpl(getIt<PortfolioRemoteDataSource>()),
  );
}

Future<void> disposeDependencies() async {
  final client = getIt<PortfolioGrpcClient>();
  await client.close();
  await getIt.reset();
}
