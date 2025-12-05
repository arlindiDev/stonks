import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/portfolio/data/grpc/portfolio_grpc_client.dart';
import 'features/portfolio/data/datasource/portfolio_remote_datasource.dart';
import 'features/portfolio/domain/repository/portfolio_repository_impl.dart';
import 'features/portfolio/presentation/state/portfolio_bloc.dart';
import 'features/portfolio/presentation/ui/screens/portfolio_screen.dart';
import 'features/theme/presentation/state/theme_bloc.dart';
import 'features/theme/presentation/state/theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final grpcClient = await PortfolioGrpcClient.createMockClient();

  runApp(MyApp(grpcClient: grpcClient));
}

class MyApp extends StatelessWidget {
  final PortfolioGrpcClient grpcClient;

  const MyApp({super.key, required this.grpcClient});

  @override
  Widget build(BuildContext context) {
    final remoteDataSource = PortfolioRemoteDataSourceImpl(grpcClient);
    
    final repository = PortfolioRepositoryImpl(remoteDataSource);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => PortfolioBloc(
            repository: repository,
          ),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Portfolio',
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: const PortfolioScreen(),
          );
        },
      ),
    );
  }
}
