import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stocks/core/error/failure.dart';
import 'package:stocks/features/portfolio/domain/repository/portfolio_repository.dart';
import 'package:stocks/features/portfolio/domain/repository/portfolio_result.dart';
import 'package:stocks/features/portfolio/presentation/state/portfolio_bloc.dart';
import 'package:stocks/features/portfolio/presentation/state/portfolio_event.dart';
import 'package:stocks/features/portfolio/presentation/state/portfolio_state.dart';
import '../../../../helpers/test_data.dart';

class MockPortfolioRepository extends Mock implements PortfolioRepository {}

void main() {
  late PortfolioBloc bloc;
  late MockPortfolioRepository mockRepository;

  setUp(() {
    mockRepository = MockPortfolioRepository();
    bloc = PortfolioBloc(repository: mockRepository);
  });

  tearDown(() {
    bloc.close();
  });

  group('PortfolioBloc', () {
    test('initial state is PortfolioInitial', () {
      expect(bloc.state, const PortfolioInitial());
    });

    group('LoadPortfolioEvent', () {
      final testData = TestData.createFullPortfolioData();

      blocTest<PortfolioBloc, PortfolioState>(
        'emits [PortfolioLoading, PortfolioLoaded] when repository returns success',
        build: () {
          when(() => mockRepository.getPortfolioData()).thenAnswer(
            (_) async => PortfolioResult.success(testData),
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const LoadPortfolioEvent()),
        expect: () => [
          const PortfolioLoading(),
          PortfolioLoaded(portfolioData: testData),
        ],
        verify: (_) {
          verify(() => mockRepository.getPortfolioData()).called(1);
        },
      );

      blocTest<PortfolioBloc, PortfolioState>(
        'emits [PortfolioLoading, PortfolioError] when repository returns network failure',
        build: () {
          when(() => mockRepository.getPortfolioData()).thenAnswer(
            (_) async => const PortfolioResult.failure(
              NetworkFailure(message: 'No internet connection'),
            ),
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const LoadPortfolioEvent()),
        expect: () => [
          const PortfolioLoading(),
          const PortfolioError(message: 'No internet connection'),
        ],
      );

      blocTest<PortfolioBloc, PortfolioState>(
        'emits [PortfolioLoading, PortfolioError] when repository returns server failure',
        build: () {
          when(() => mockRepository.getPortfolioData()).thenAnswer(
            (_) async => const PortfolioResult.failure(
              ServerFailure(message: 'Server error occurred'),
            ),
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const LoadPortfolioEvent()),
        expect: () => [
          const PortfolioLoading(),
          const PortfolioError(message: 'Server error occurred'),
        ],
      );

      blocTest<PortfolioBloc, PortfolioState>(
        'emits [PortfolioLoading, PortfolioError] when repository returns data parsing failure',
        build: () {
          when(() => mockRepository.getPortfolioData()).thenAnswer(
            (_) async => const PortfolioResult.failure(
              DataParsingFailure(message: 'Failed to parse data'),
            ),
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const LoadPortfolioEvent()),
        expect: () => [
          const PortfolioLoading(),
          const PortfolioError(message: 'Failed to parse data'),
        ],
      );

      blocTest<PortfolioBloc, PortfolioState>(
        'handles multiple consecutive load events',
        build: () {
          when(() => mockRepository.getPortfolioData()).thenAnswer(
            (_) async => PortfolioResult.success(testData),
          );
          return bloc;
        },
        act: (bloc) {
          bloc.add(const LoadPortfolioEvent());
          bloc.add(const LoadPortfolioEvent());
        },
        expect: () => [
          const PortfolioLoading(),
          PortfolioLoaded(portfolioData: testData),
          const PortfolioLoading(),
          PortfolioLoaded(portfolioData: testData),
        ],
      );
    });

    group('RefreshPortfolioEvent', () {
      final testData = TestData.createFullPortfolioData();

      blocTest<PortfolioBloc, PortfolioState>(
        'emits [PortfolioLoaded] when repository returns success (no loading state)',
        build: () {
          when(() => mockRepository.getPortfolioData()).thenAnswer(
            (_) async => PortfolioResult.success(testData),
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const RefreshPortfolioEvent()),
        expect: () => [
          PortfolioLoaded(portfolioData: testData),
        ],
        verify: (_) {
          verify(() => mockRepository.getPortfolioData()).called(1);
        },
      );

      blocTest<PortfolioBloc, PortfolioState>(
        'emits [PortfolioError] when repository returns failure',
        build: () {
          when(() => mockRepository.getPortfolioData()).thenAnswer(
            (_) async => const PortfolioResult.failure(
              NetworkFailure(message: 'Connection timeout'),
            ),
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const RefreshPortfolioEvent()),
        expect: () => [
          const PortfolioError(message: 'Connection timeout'),
        ],
      );

      blocTest<PortfolioBloc, PortfolioState>(
        'refresh after successful load updates data',
        build: () {
          when(() => mockRepository.getPortfolioData()).thenAnswer(
            (_) async => PortfolioResult.success(testData),
          );
          return bloc;
        },
        act: (bloc) async {
          bloc.add(const LoadPortfolioEvent());
          await Future.delayed(const Duration(milliseconds: 100));
          when(() => mockRepository.getPortfolioData()).thenAnswer(
            (_) async => PortfolioResult.success(
              [TestData.createPortfolioChart()],
            ),
          );
          bloc.add(const RefreshPortfolioEvent());
        },
        skip: 2, // Skip initial loading and loaded states
        verify: (bloc) {
          final state = bloc.state as PortfolioLoaded;
          expect(state.portfolioData.length, 1);
        },
      );
    });

    group('error handling', () {
      blocTest<PortfolioBloc, PortfolioState>(
        'handles unexpected failure with custom message',
        build: () {
          when(() => mockRepository.getPortfolioData()).thenAnswer(
            (_) async => const PortfolioResult.failure(
              UnexpectedFailure(message: 'Something went wrong'),
            ),
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const LoadPortfolioEvent()),
        expect: () => [
          const PortfolioLoading(),
          const PortfolioError(message: 'Something went wrong'),
        ],
      );
    });
  });
}

