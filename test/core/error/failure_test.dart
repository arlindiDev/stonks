import 'package:flutter_test/flutter_test.dart';
import 'package:stocks/core/error/failure.dart';

void main() {
  group('Failure', () {
    group('NetworkFailure', () {
      test('has correct default message', () {
        const failure = NetworkFailure();
        expect(failure.message, 'Network connection failed');
      });

      test('accepts custom message', () {
        const failure = NetworkFailure(message: 'Custom network error');
        expect(failure.message, 'Custom network error');
      });

      test('accepts custom code', () {
        const failure = NetworkFailure(code: 'NET_001');
        expect(failure.code, 'NET_001');
      });

      test('stores original error', () {
        final originalError = Exception('Socket timeout');
        final failure = NetworkFailure(originalError: originalError);
        expect(failure.originalError, originalError);
      });

      test('two failures with same message are equal', () {
        const failure1 = NetworkFailure(message: 'Error');
        const failure2 = NetworkFailure(message: 'Error');
        expect(failure1, equals(failure2));
      });

      test('two failures with different messages are not equal', () {
        const failure1 = NetworkFailure(message: 'Error 1');
        const failure2 = NetworkFailure(message: 'Error 2');
        expect(failure1, isNot(equals(failure2)));
      });

      test('props includes message and code', () {
        const failure = NetworkFailure(message: 'Test', code: 'CODE');
        expect(failure.props, ['Test', 'CODE']);
      });
    });

    group('ServerFailure', () {
      test('has correct default message', () {
        const failure = ServerFailure();
        expect(failure.message, 'Server error occurred');
      });

      test('accepts custom message and code', () {
        const failure = ServerFailure(
          message: 'Internal server error',
          code: '500',
        );
        expect(failure.message, 'Internal server error');
        expect(failure.code, '500');
      });

      test('two server failures with same properties are equal', () {
        const failure1 = ServerFailure(message: 'Error', code: '500');
        const failure2 = ServerFailure(message: 'Error', code: '500');
        expect(failure1, equals(failure2));
      });
    });

    group('DataParsingFailure', () {
      test('has correct default message', () {
        const failure = DataParsingFailure();
        expect(failure.message, 'Failed to parse data');
      });

      test('accepts custom message', () {
        const failure = DataParsingFailure(
          message: 'Invalid JSON format',
        );
        expect(failure.message, 'Invalid JSON format');
      });

      test('stores parsing error details', () {
        const parseError = FormatException('Invalid format');
        const failure = DataParsingFailure(originalError: parseError);
        expect(failure.originalError, parseError);
      });
    });

    group('UnexpectedFailure', () {
      test('has correct default message', () {
        const failure = UnexpectedFailure();
        expect(failure.message, 'An unexpected error occurred');
      });

      test('accepts custom message and error', () {
        final error = Exception('Unexpected issue');
        final failure = UnexpectedFailure(
          message: 'Something went wrong',
          originalError: error,
        );
        expect(failure.message, 'Something went wrong');
        expect(failure.originalError, error);
      });
    });

    group('Failure polymorphism', () {
      test('different failure types are not equal', () {
        const networkFailure = NetworkFailure(message: 'Error');
        const serverFailure = ServerFailure(message: 'Error');
        expect(networkFailure, isNot(equals(serverFailure)));
      });

      test('can be used polymorphically', () {
        final List<Failure> failures = [
          const NetworkFailure(),
          const ServerFailure(),
          const DataParsingFailure(),
          const UnexpectedFailure(),
        ];

        expect(failures.length, 4);
        expect(failures[0], isA<NetworkFailure>());
        expect(failures[1], isA<ServerFailure>());
        expect(failures[2], isA<DataParsingFailure>());
        expect(failures[3], isA<UnexpectedFailure>());
      });

      test('all failures extend Failure', () {
        expect(const NetworkFailure(), isA<Failure>());
        expect(const ServerFailure(), isA<Failure>());
        expect(const DataParsingFailure(), isA<Failure>());
        expect(const UnexpectedFailure(), isA<Failure>());
      });
    });
  });
}

