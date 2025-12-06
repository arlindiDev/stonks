import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stocks/features/portfolio/domain/repository/portfolio_repository.dart';
import 'package:stocks/features/portfolio/domain/repository/portfolio_result.dart';
import 'package:stocks/features/portfolio/presentation/state/portfolio_bloc.dart';
import 'package:stocks/features/portfolio/presentation/state/portfolio_event.dart';
import 'package:stocks/features/portfolio/presentation/ui/screens/portfolio_screen.dart';
import 'package:stocks/features/portfolio/presentation/ui/widgets/portfolio_chart_card.dart';
import 'package:stocks/features/portfolio/presentation/ui/widgets/portfolio_total_card.dart';
import 'package:stocks/features/portfolio/presentation/ui/widgets/portfolio_item_card.dart';
import 'package:stocks/features/theme/presentation/state/theme_bloc.dart';
import 'package:stocks/features/theme/themes.dart';
import 'package:stocks/core/error/failure.dart';
import '../../../../../helpers/test_data.dart';

class MockPortfolioRepository extends Mock implements PortfolioRepository {}

void main() {
  late PortfolioBloc portfolioBloc;
  late ThemeBloc themeBloc;
  late MockPortfolioRepository mockRepository;

  setUp(() {
    mockRepository = MockPortfolioRepository();
    themeBloc = ThemeBloc();
  });

  tearDown(() {
    themeBloc.close();
  });

  Widget createWidgetUnderTest(PortfolioBloc bloc) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PortfolioBloc>.value(value: bloc),
          BlocProvider<ThemeBloc>.value(value: themeBloc),
        ],
        child: const PortfolioScreen(),
      ),
    );
  }

  group('PortfolioScreen - Loading State', () {
    testWidgets('shows CircularProgressIndicator when loading', (tester) async {
      bool shouldComplete = false;
      
      when(() => mockRepository.getPortfolioData()).thenAnswer(
        (_) async {
          while (!shouldComplete) {
            await Future.delayed(const Duration(milliseconds: 100));
          }
          return PortfolioResult.success(TestData.createFullPortfolioData());
        },
      );

      portfolioBloc = PortfolioBloc(repository: mockRepository);
      
      await tester.pumpWidget(createWidgetUnderTest(portfolioBloc));
      
      await tester.pump();
      
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      
      shouldComplete = true;
      await tester.pumpAndSettle();
      
      portfolioBloc.close();
    });
  });

  group('PortfolioScreen - Error State', () {
    testWidgets('shows error message when repository fails', (tester) async {
      when(() => mockRepository.getPortfolioData()).thenAnswer(
        (_) async => const PortfolioResult.failure(
          NetworkFailure(message: 'Network error'),
        ),
      );

      portfolioBloc = PortfolioBloc(repository: mockRepository);
      
      await tester.pumpWidget(createWidgetUnderTest(portfolioBloc));
      
      await tester.pumpAndSettle();

      expect(find.text('Error: Network error'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
      
      portfolioBloc.close();
    });

    testWidgets('shows retry button on error', (tester) async {
      when(() => mockRepository.getPortfolioData()).thenAnswer(
        (_) async => const PortfolioResult.failure(
          ServerFailure(message: 'Server error'),
        ),
      );

      portfolioBloc = PortfolioBloc(repository: mockRepository);
      
      await tester.pumpWidget(createWidgetUnderTest(portfolioBloc));
      await tester.pumpAndSettle();

      expect(find.text('Retry'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      
      portfolioBloc.close();
    });

    testWidgets('retry button reloads data', (tester) async {
      when(() => mockRepository.getPortfolioData()).thenAnswer(
        (_) async => const PortfolioResult.failure(
          NetworkFailure(message: 'Connection failed'),
        ),
      );

      portfolioBloc = PortfolioBloc(repository: mockRepository);
      
      await tester.pumpWidget(createWidgetUnderTest(portfolioBloc));
      await tester.pumpAndSettle();

      expect(find.text('Retry'), findsOneWidget);

      when(() => mockRepository.getPortfolioData()).thenAnswer(
        (_) async => PortfolioResult.success(TestData.createFullPortfolioData()),
      );

      await tester.tap(find.text('Retry'));
      await tester.pumpAndSettle();

      expect(find.byType(PortfolioTotalCard), findsOneWidget);
      expect(find.byType(PortfolioChartCard), findsOneWidget);
      
      portfolioBloc.close();
    });
  });

  group('PortfolioScreen - Loaded State', () {
    testWidgets('displays portfolio total card', (tester) async {
      when(() => mockRepository.getPortfolioData()).thenAnswer(
        (_) async => PortfolioResult.success(TestData.createFullPortfolioData()),
      );

      portfolioBloc = PortfolioBloc(repository: mockRepository);
      
      await tester.pumpWidget(createWidgetUnderTest(portfolioBloc));
      await tester.pumpAndSettle();

      expect(find.byType(PortfolioTotalCard), findsOneWidget);
      
      portfolioBloc.close();
    });

    testWidgets('displays portfolio chart card', (tester) async {
      when(() => mockRepository.getPortfolioData()).thenAnswer(
        (_) async => PortfolioResult.success(TestData.createFullPortfolioData()),
      );

      portfolioBloc = PortfolioBloc(repository: mockRepository);
      
      await tester.pumpWidget(createWidgetUnderTest(portfolioBloc));
      await tester.pumpAndSettle();

      expect(find.byType(PortfolioChartCard), findsOneWidget);
      
      portfolioBloc.close();
    });

    testWidgets('displays all portfolio item cards', (tester) async {
      final testData = TestData.createFullPortfolioData();
      when(() => mockRepository.getPortfolioData()).thenAnswer(
        (_) async => PortfolioResult.success(testData),
      );

      portfolioBloc = PortfolioBloc(repository: mockRepository);
      
      await tester.pumpWidget(createWidgetUnderTest(portfolioBloc));
      await tester.pumpAndSettle();

      expect(find.byType(PortfolioItemCard), findsAtLeastNWidgets(1));
      
      expect(find.text('AAPL'), findsOneWidget);
      
      portfolioBloc.close();
    });

    testWidgets('displays total value correctly', (tester) async {
      when(() => mockRepository.getPortfolioData()).thenAnswer(
        (_) async => PortfolioResult.success(TestData.createFullPortfolioData()),
      );

      portfolioBloc = PortfolioBloc(repository: mockRepository);
      
      await tester.pumpWidget(createWidgetUnderTest(portfolioBloc));
      await tester.pumpAndSettle();

      expect(find.text('\$125,000.00'), findsAtLeastNWidgets(1));
      
      expect(find.byType(PortfolioTotalCard), findsOneWidget);
      
      portfolioBloc.close();
    });

    testWidgets('shows RefreshIndicator for pull-to-refresh', (tester) async {
      when(() => mockRepository.getPortfolioData()).thenAnswer(
        (_) async => PortfolioResult.success(TestData.createFullPortfolioData()),
      );

      portfolioBloc = PortfolioBloc(repository: mockRepository);
      
      await tester.pumpWidget(createWidgetUnderTest(portfolioBloc));
      await tester.pumpAndSettle();

      expect(find.byType(RefreshIndicator), findsOneWidget);
      
      portfolioBloc.close();
    });
  });

  group('PortfolioScreen - UI Elements', () {
    testWidgets('has AppBar with Portfolio title', (tester) async {
      when(() => mockRepository.getPortfolioData()).thenAnswer(
        (_) async => PortfolioResult.success(TestData.createFullPortfolioData()),
      );

      portfolioBloc = PortfolioBloc(repository: mockRepository);
      
      await tester.pumpWidget(createWidgetUnderTest(portfolioBloc));
      await tester.pump();

      expect(find.text('Portfolio'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      
      portfolioBloc.close();
    });

    testWidgets('has theme toggle button', (tester) async {
      when(() => mockRepository.getPortfolioData()).thenAnswer(
        (_) async => PortfolioResult.success(TestData.createFullPortfolioData()),
      );

      portfolioBloc = PortfolioBloc(repository: mockRepository);
      
      await tester.pumpWidget(createWidgetUnderTest(portfolioBloc));
      await tester.pump();

      expect(find.byType(IconButton), findsOneWidget);
      
      portfolioBloc.close();
    });

    testWidgets('theme toggle changes theme mode', (tester) async {
      when(() => mockRepository.getPortfolioData()).thenAnswer(
        (_) async => PortfolioResult.success(TestData.createFullPortfolioData()),
      );

      portfolioBloc = PortfolioBloc(repository: mockRepository);
      
      await tester.pumpWidget(createWidgetUnderTest(portfolioBloc));
      await tester.pump();

      expect(themeBloc.state.themeMode, AppThemeMode.retailBank);

      await tester.tap(find.byType(IconButton));
      await tester.pump();

      expect(themeBloc.state.themeMode, AppThemeMode.neobank);
      
      portfolioBloc.close();
    });
  });

  group('PortfolioScreen - Repository Interaction', () {
    testWidgets('calls repository on initialization', (tester) async {
      when(() => mockRepository.getPortfolioData()).thenAnswer(
        (_) async => PortfolioResult.success(TestData.createFullPortfolioData()),
      );

      portfolioBloc = PortfolioBloc(repository: mockRepository);
      
      await tester.pumpWidget(createWidgetUnderTest(portfolioBloc));
      await tester.pump();

      verify(() => mockRepository.getPortfolioData()).called(1);
      
      portfolioBloc.close();
    });
  });

  group('PortfolioScreen - Edge Cases', () {
    testWidgets('handles empty portfolio data', (tester) async {
      when(() => mockRepository.getPortfolioData()).thenAnswer(
        (_) async => const PortfolioResult.success([]),
      );

      portfolioBloc = PortfolioBloc(repository: mockRepository);
      
      await tester.pumpWidget(createWidgetUnderTest(portfolioBloc));
      await tester.pumpAndSettle();

      expect(find.byType(PortfolioTotalCard), findsNothing);
      expect(find.byType(PortfolioItemCard), findsNothing);
      
      portfolioBloc.close();
    });
  });
}
