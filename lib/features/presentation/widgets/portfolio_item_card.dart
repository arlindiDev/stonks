import 'package:flutter/material.dart';
import '../mock_data.dart';

class PortfolioItemCard extends StatelessWidget {
  final PortfolioItem item;

  const PortfolioItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = item.unrealizedPL >= 0;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ticker
            Text(
              item.ticker,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            // Position
            _buildRow('Position', '${item.position.toStringAsFixed(0)} shares'),
            const SizedBox(height: 6),
            
            // Average Price
            _buildRow('AVG Price', '\$${item.avgPrice.toStringAsFixed(2)}'),
            const SizedBox(height: 6),
            
            // Current Price
            _buildRow('Current Price', '\$${item.currentPrice.toStringAsFixed(2)}'),
            const SizedBox(height: 6),
            
            // Market Value
            _buildRow('Market Value', '\$${item.marketValue.toStringAsFixed(2)}'),
            const SizedBox(height: 6),
            
            // % of Portfolio
            _buildRow('% of Portfolio', '${item.portfolioPercent.toStringAsFixed(2)}%'),
            const SizedBox(height: 6),
            
            // Unrealized P&L
            _buildRow(
              'Unrealized P&L',
              '${isPositive ? '+' : '-'}\$${item.unrealizedPL.abs().toStringAsFixed(2)}',
              color: isPositive ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 6),
            
            // Unrealized P&L %
            _buildRow(
              'Unrealized P&L %',
              '${isPositive ? '+' : '-'}${item.unrealizedPLPercent.abs().toStringAsFixed(2)}%',
              color: isPositive ? Colors.green : Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, {Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
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
