import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../theme/presentation/state/theme_bloc.dart';
import '../../../../theme/presentation/state/theme_event.dart';
import '../../../../theme/presentation/state/theme_state.dart';
import '../../../../mock_data.dart';
import '../widgets/portfolio_chart_card.dart';
import '../widgets/portfolio_total_card.dart';
import '../widgets/portfolio_item_card.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final portfolioData = getMockPortfolioData();

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
          body: ListView.builder(
            itemCount: portfolioData.length,
            itemBuilder: (context, index) {
              final item = portfolioData[index];
              
              if (item is PortfolioChart) {
                return PortfolioChartCard(chart: item);
              } else if (item is PortfolioTotal) {
                return PortfolioTotalCard(total: item);
              } else if (item is PortfolioItem) {
                return PortfolioItemCard(item: item);
              }
              
              return const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}
