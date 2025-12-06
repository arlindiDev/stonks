import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stocks/features/portfolio/domain/entities/portfolio_total.dart';
import 'package:stocks/features/portfolio/presentation/ui/widgets/portfolio_total_card.dart';

void main() {
  group('PortfolioTotalCard', () {
    testWidgets('displays total value with correct formatting', (tester) async {
      final total = PortfolioTotal(totalValue: 125000.00);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PortfolioTotalCard(total: total),
          ),
        ),
      );

      expect(find.text('Total Value'), findsOneWidget);
      expect(find.text('\$125,000.00'), findsOneWidget);
    });

    testWidgets('displays large total value correctly', (tester) async {
      final total = PortfolioTotal(totalValue: 1234567.89);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PortfolioTotalCard(total: total),
          ),
        ),
      );

      expect(find.text('\$1,234,567.89'), findsOneWidget);
    });

    testWidgets('displays small total value correctly', (tester) async {
      final total = PortfolioTotal(totalValue: 99.99);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PortfolioTotalCard(total: total),
          ),
        ),
      );

      expect(find.text('\$99.99'), findsOneWidget);
    });

    testWidgets('displays zero total value correctly', (tester) async {
      final total = PortfolioTotal(totalValue: 0.0);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PortfolioTotalCard(total: total),
          ),
        ),
      );

      expect(find.text('\$0.00'), findsOneWidget);
    });

    testWidgets('renders as a Card widget', (tester) async {
      final total = PortfolioTotal(totalValue: 100000.0);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PortfolioTotalCard(total: total),
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
    });
  });
}

