import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/portfolio/domain/repository/portfolio_repository_impl.dart';
import 'features/portfolio/presentation/state/portfolio_bloc.dart';
import 'features/portfolio/presentation/ui/screens/portfolio_screen.dart';
import 'features/theme/presentation/state/theme_bloc.dart';
import 'features/theme/presentation/state/theme_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => PortfolioBloc(
            repository: PortfolioRepositoryImpl(),
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
