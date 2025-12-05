import 'package:flutter/material.dart';
import '../mock_data.dart';
import 'portfolio_total_card.dart';
import 'portfolio_item_card.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final portfolioData = getMockPortfolioData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: portfolioData.length,
        itemBuilder: (context, index) {
          final item = portfolioData[index];
          
          if (item is PortfolioTotal) {
            return PortfolioTotalCard(total: item);
          } else if (item is PortfolioItem) {
            return PortfolioItemCard(item: item);
          }
          
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
