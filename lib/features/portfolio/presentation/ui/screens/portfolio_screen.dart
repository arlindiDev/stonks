import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../theme/presentation/state/theme_bloc.dart';
import '../../../../theme/presentation/state/theme_event.dart';
import '../../../../theme/presentation/state/theme_state.dart';
import '../../../domain/entities/portfolio_chart.dart';
import '../../../domain/entities/portfolio_item.dart';
import '../../state/portfolio_bloc.dart';
import '../../state/portfolio_event.dart';
import '../../state/portfolio_state.dart';
import '../widgets/portfolio_chart_card.dart';
import '../widgets/portfolio_item_card.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PortfolioBloc>().add(const LoadPortfolioEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Portfolio'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: Icon(
                      themeState.isRetailBank 
                          ? Icons.nights_stay_outlined 
                          : Icons.wb_sunny_outlined,
                      key: ValueKey(themeState.isRetailBank),
                    ),
                  ),
                  tooltip: themeState.isRetailBank 
                      ? 'Switch to Neobank Theme' 
                      : 'Switch to Retail Bank Theme',
                  onPressed: () {
                    context.read<ThemeBloc>().add(ToggleThemeEvent());
                  },
                ),
              ),
            ],
          ),
          body: BlocBuilder<PortfolioBloc, PortfolioState>(
            builder: (context, portfolioState) {
              if (portfolioState is PortfolioLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (portfolioState is PortfolioError) {
                final errorColor = themeState.negativeColor;
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 48,
                          color: errorColor,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Error: ${portfolioState.message}',
                          style: TextStyle(color: errorColor),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<PortfolioBloc>().add(const LoadPortfolioEvent());
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (portfolioState is PortfolioLoaded) {
                final portfolioData = portfolioState.portfolioData;
                
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<PortfolioBloc>().add(const RefreshPortfolioEvent());
                    await context.read<PortfolioBloc>().stream.firstWhere(
                      (state) => state is PortfolioLoaded || state is PortfolioError,
                    );
                  },
                  child: ListView.builder(
                    itemCount: portfolioData.length,
                    itemBuilder: (context, index) {
                      final item = portfolioData[index];
                      
                      if (item is PortfolioChart) {
                        return PortfolioChartCard(chart: item);
                      } else if (item is PortfolioItem) {
                        return PortfolioItemCard(item: item);
                      }
                      
                      return const SizedBox.shrink();
                    },
                  ),
                );
              }
              
              return const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}
