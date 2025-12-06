import 'package:get_it/get_it.dart';
import '../../features/portfolio/data/datasource/portfolio_remote_datasource.dart';
import '../../features/portfolio/data/grpc/portfolio_grpc_client.dart';
import '../../features/portfolio/domain/repository/portfolio_repository.dart';
import '../../features/portfolio/domain/repository/portfolio_repository_impl.dart';
import '../../features/portfolio/presentation/state/portfolio_bloc.dart';
import '../../features/theme/presentation/state/theme_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Theme
  getIt.registerLazySingleton<ThemeBloc>(() => ThemeBloc());

  // Portfolio - Data Layer
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

  // Portfolio - Presentation Layer
  getIt.registerLazySingleton<PortfolioBloc>(
    () => PortfolioBloc(repository: getIt<PortfolioRepository>()),
  );
}

Future<void> disposeDependencies() async {
  // Close BLoCs
  if (getIt.isRegistered<ThemeBloc>()) {
    await getIt<ThemeBloc>().close();
  }
  
  if (getIt.isRegistered<PortfolioBloc>()) {
    await getIt<PortfolioBloc>().close();
  }
  
  // Close gRPC client
  if (getIt.isRegistered<PortfolioGrpcClient>()) {
    final client = getIt<PortfolioGrpcClient>();
    await client.close();
  }
  
  await getIt.reset();
}
