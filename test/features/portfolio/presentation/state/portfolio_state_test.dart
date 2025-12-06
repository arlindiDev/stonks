import 'package:flutter_test/flutter_test.dart';
import 'package:stocks/features/portfolio/presentation/state/portfolio_state.dart';
import '../../../../helpers/test_data.dart';

void main() {
  group('PortfolioState', () {
    group('PortfolioInitial', () {
      test('supports value equality', () {
        const state1 = PortfolioInitial();
        const state2 = PortfolioInitial();
        expect(state1, equals(state2));
      });

      test('props are empty', () {
        const state = PortfolioInitial();
        expect(state.props, isEmpty);
      });
    });

    group('PortfolioLoading', () {
      test('supports value equality', () {
        const state1 = PortfolioLoading();
        const state2 = PortfolioLoading();
        expect(state1, equals(state2));
      });

      test('props are empty', () {
        const state = PortfolioLoading();
        expect(state.props, isEmpty);
      });
    });

    group('PortfolioLoaded', () {
      final testData1 = TestData.createFullPortfolioData();
      final testData2 = TestData.createFullPortfolioData();

      test('supports value equality when portfolioData is the same', () {
        final state1 = PortfolioLoaded(portfolioData: testData1);
        final state2 = PortfolioLoaded(portfolioData: testData1);
        expect(state1, equals(state2));
      });

      test('two states with different data are not equal', () {
        final state1 = PortfolioLoaded(portfolioData: testData1);
        final differentData = [TestData.createPortfolioTotal(totalValue: 999999.0)];
        final state2 = PortfolioLoaded(portfolioData: differentData);
        expect(state1, isNot(equals(state2)));
      });

      test('props include portfolioData', () {
        final state = PortfolioLoaded(portfolioData: testData1);
        expect(state.props, [testData1]);
      });

      test('can access portfolioData', () {
        final state = PortfolioLoaded(portfolioData: testData1);
        expect(state.portfolioData, testData1);
        expect(state.portfolioData.length, 5); // total + chart + 3 items
      });
    });

    group('PortfolioError', () {
      test('supports value equality with same message', () {
        const state1 = PortfolioError(message: 'Error message');
        const state2 = PortfolioError(message: 'Error message');
        expect(state1, equals(state2));
      });

      test('two states with different messages are not equal', () {
        const state1 = PortfolioError(message: 'Error 1');
        const state2 = PortfolioError(message: 'Error 2');
        expect(state1, isNot(equals(state2)));
      });

      test('props include message', () {
        const state = PortfolioError(message: 'Network error');
        expect(state.props, ['Network error']);
      });

      test('can access message', () {
        const state = PortfolioError(message: 'Server error');
        expect(state.message, 'Server error');
      });
    });

    group('different state types', () {
      test('different state types are not equal', () {
        const initial = PortfolioInitial();
        const loading = PortfolioLoading();
        final loaded = PortfolioLoaded(portfolioData: TestData.createFullPortfolioData());
        const error = PortfolioError(message: 'Error');

        expect(initial, isNot(equals(loading)));
        expect(initial, isNot(equals(loaded)));
        expect(initial, isNot(equals(error)));
        expect(loading, isNot(equals(loaded)));
        expect(loading, isNot(equals(error)));
        expect(loaded, isNot(equals(error)));
      });

      test('all states extend PortfolioState', () {
        expect(const PortfolioInitial(), isA<PortfolioState>());
        expect(const PortfolioLoading(), isA<PortfolioState>());
        expect(PortfolioLoaded(portfolioData: []), isA<PortfolioState>());
        expect(const PortfolioError(message: ''), isA<PortfolioState>());
      });
    });
  });
}

