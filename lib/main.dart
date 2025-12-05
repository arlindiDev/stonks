import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/portfolio/presentation/portfolio_screen.dart';
import 'features/theme/theme_bloc.dart';
import 'features/theme/theme_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
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
