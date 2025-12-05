import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection.dart';
import 'features/portfolio/presentation/state/portfolio_bloc.dart';
import 'features/portfolio/presentation/ui/screens/portfolio_screen.dart';
import 'features/theme/presentation/state/theme_bloc.dart';
import 'features/theme/presentation/state/theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();

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
            repository: getIt(),
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
