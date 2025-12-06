import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../theme/presentation/state/theme_bloc.dart';
import '../../../../theme/presentation/state/theme_state.dart';
import '../../../domain/entities/portfolio_item.dart';
import '../../../../utils/formatters.dart';

class PortfolioItemCard extends StatelessWidget {
  final PortfolioItem item;

  const PortfolioItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = item.unrealizedPL >= 0;

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return _buildCard(context, themeState, isPositive);
      },
    );
  }

  Widget _buildCard(BuildContext context, ThemeState themeState, bool isPositive) {
    final isDayChangePositive = item.dayChangePercent >= 0;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.ticker,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.companyName,
              style: TextStyle(
                fontSize: 14,
                color: themeState.textSecondaryColor,
              ),
            ),
            const SizedBox(height: 12),
            
            _buildRow(themeState, 'Current Price', Formatters.currency(item.currentPrice)),
            const SizedBox(height: 6),
            
            _buildRow(
              themeState,
              '% Day Change',
              Formatters.percentWithSign(item.dayChangePercent),
              color: isDayChangePositive ? themeState.positiveColor : themeState.negativeColor,
            ),
            const SizedBox(height: 6),
            
            _buildRow(themeState, 'Position', Formatters.shares(item.position)),
            const SizedBox(height: 6),
            
            _buildRow(themeState, 'AVG Price', Formatters.currency(item.avgPrice)),
            const SizedBox(height: 6),
            
            _buildRow(themeState, 'Market Value', Formatters.currency(item.marketValue)),
            const SizedBox(height: 6),
            
            _buildRow(themeState, '% of Portfolio', Formatters.percent(item.portfolioPercent)),
            const SizedBox(height: 6),
            
            _buildRow(
              themeState,
              'Unrealized P&L',
              Formatters.currencyWithSign(item.unrealizedPL),
              color: isPositive ? themeState.positiveColor : themeState.negativeColor,
            ),
            const SizedBox(height: 6),
            
            _buildRow(
              themeState,
              'Unrealized P&L %',
              Formatters.percentWithSign(item.unrealizedPLPercent),
              color: isPositive ? themeState.positiveColor : themeState.negativeColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(ThemeState themeState, String label, String value, {Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: themeState.textSecondaryColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}
