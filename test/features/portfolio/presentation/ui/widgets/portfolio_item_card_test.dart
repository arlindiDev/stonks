import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks/features/portfolio/domain/entities/portfolio_item.dart';
import 'package:stocks/features/portfolio/presentation/ui/widgets/portfolio_item_card.dart';
import 'package:stocks/features/theme/presentation/state/theme_bloc.dart';

void main() {
  late ThemeBloc themeBloc;

  setUp(() {
    themeBloc = ThemeBloc();
  });

  tearDown(() {
    themeBloc.close();
  });

  Widget createWidgetUnderTest(PortfolioItem item) {
    return MaterialApp(
      home: BlocProvider<ThemeBloc>.value(
        value: themeBloc,
        child: Scaffold(
          body: PortfolioItemCard(item: item),
        ),
      ),
    );
  }

  group('PortfolioItemCard', () {
    testWidgets('displays ticker symbol', (tester) async {
      final item = PortfolioItem(
        ticker: 'AAPL',
        companyName: 'Apple Inc.',
        position: 100.0,
        avgPrice: 150.0,
        currentPrice: 175.0,
        dayChangePercent: 1.25,
        marketValue: 17500.0,
        portfolioPercent: 14.0,
        unrealizedPL: 2500.0,
        unrealizedPLPercent: 16.67,
      );

      await tester.pumpWidget(createWidgetUnderTest(item));

      expect(find.text('AAPL'), findsOneWidget);
    });

    testWidgets('displays all item details', (tester) async {
      final item = PortfolioItem(
        ticker: 'GOOGL',
        companyName: 'Alphabet Inc.',
        position: 50.0,
        avgPrice: 140.0,
        currentPrice: 155.0,
        dayChangePercent: -0.42,
        marketValue: 7750.0,
        portfolioPercent: 6.2,
        unrealizedPL: 750.0,
        unrealizedPLPercent: 10.71,
      );

      await tester.pumpWidget(createWidgetUnderTest(item));

      expect(find.text('Position'), findsOneWidget);
      expect(find.text('50'), findsOneWidget);

      expect(find.text('AVG Price'), findsOneWidget);
      expect(find.text('\$140.00'), findsOneWidget);

      expect(find.text('Current Price'), findsOneWidget);
      expect(find.text('\$155.00'), findsOneWidget);

      expect(find.text('% Day Change'), findsOneWidget);
      expect(find.text('-0.42%'), findsOneWidget);

      expect(find.text('Market Value'), findsOneWidget);
      expect(find.text('\$7,750.00'), findsOneWidget);

      expect(find.text('% of Portfolio'), findsOneWidget);
      expect(find.text('6.20%'), findsOneWidget);

      expect(find.text('Unrealized P&L'), findsOneWidget);
      expect(find.text('+\$750.00'), findsOneWidget);

      expect(find.text('Unrealized P&L %'), findsOneWidget);
      expect(find.text('+10.71%'), findsOneWidget);
    });

    testWidgets('displays negative P/L with minus sign', (tester) async {
      final item = PortfolioItem(
        ticker: 'LOSS',
        companyName: 'Loss Corp',
        position: 100.0,
        avgPrice: 100.0,
        currentPrice: 80.0,
        dayChangePercent: -3.5,
        marketValue: 8000.0,
        portfolioPercent: 8.0,
        unrealizedPL: -2000.0,
        unrealizedPLPercent: -20.0,
      );

      await tester.pumpWidget(createWidgetUnderTest(item));

      expect(find.text('-\$2,000.00'), findsOneWidget);
      expect(find.text('-20.00%'), findsOneWidget);
    });

    testWidgets('displays zero P/L correctly', (tester) async {
      final item = PortfolioItem(
        ticker: 'FLAT',
        companyName: 'Flat Corp',
        position: 100.0,
        avgPrice: 100.0,
        currentPrice: 100.0,
        dayChangePercent: 0.0,
        marketValue: 10000.0,
        portfolioPercent: 10.0,
        unrealizedPL: 0.0,
        unrealizedPLPercent: 0.0,
      );

      await tester.pumpWidget(createWidgetUnderTest(item));

      expect(find.text('+\$0.00'), findsOneWidget);
      // Now we have +0.00% twice (day change and unrealized P&L %)
      expect(find.text('+0.00%'), findsNWidgets(2));
    });

    testWidgets('renders as a Card widget', (tester) async {
      final item = PortfolioItem(
        ticker: 'AAPL',
        companyName: 'Apple Inc.',
        position: 100.0,
        avgPrice: 150.0,
        currentPrice: 175.0,
        dayChangePercent: 1.25,
        marketValue: 17500.0,
        portfolioPercent: 14.0,
        unrealizedPL: 2500.0,
        unrealizedPLPercent: 16.67,
      );

      await tester.pumpWidget(createWidgetUnderTest(item));

      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('has all required labels', (tester) async {
      final item = PortfolioItem(
        ticker: 'TEST',
        companyName: 'Test Corp',
        position: 1.0,
        avgPrice: 1.0,
        currentPrice: 1.0,
        dayChangePercent: 0.0,
        marketValue: 1.0,
        portfolioPercent: 1.0,
        unrealizedPL: 0.0,
        unrealizedPLPercent: 0.0,
      );

      await tester.pumpWidget(createWidgetUnderTest(item));

      expect(find.text('Position'), findsOneWidget);
      expect(find.text('AVG Price'), findsOneWidget);
      expect(find.text('Current Price'), findsOneWidget);
      expect(find.text('% Day Change'), findsOneWidget);
      expect(find.text('Market Value'), findsOneWidget);
      expect(find.text('% of Portfolio'), findsOneWidget);
      expect(find.text('Unrealized P&L'), findsOneWidget);
      expect(find.text('Unrealized P&L %'), findsOneWidget);
    });

  });
}

