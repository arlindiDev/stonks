import 'package:flutter_test/flutter_test.dart';
import 'package:stocks/core/error/failure.dart';
import 'package:stocks/core/error/result.dart';

void main() {
  group('Result', () {
    group('success', () {
      test('creates a success result with data', () {
        const testData = 'test data';
        const result = Result.success(testData);

        expect(result.isSuccess, true);
        expect(result.isFailure, false);
        expect(result.getDataOrNull<String>(), testData);
        expect(result.getFailureOrNull(), null);
      });

      test('returns correct data for different types', () {
        const intResult = Result.success(42);
        const stringResult = Result.success('hello');
        final listResult = Result.success([1, 2, 3]);

        expect(intResult.getDataOrNull<int>(), 42);
        expect(stringResult.getDataOrNull<String>(), 'hello');
        expect(listResult.getDataOrNull<List<int>>(), [1, 2, 3]);
      });

      test('getDataOrNull returns null for wrong type', () {
        const result = Result.success('string data');

        expect(result.getDataOrNull<int>(), null);
        expect(result.getDataOrNull<String>(), 'string data');
      });
    });

    group('failure', () {
      test('creates a failure result with error', () {
        const failure = NetworkFailure(message: 'Connection failed');
        const result = Result.failure(failure);

        expect(result.isSuccess, false);
        expect(result.isFailure, true);
        expect(result.getDataOrNull(), null);
        expect(result.getFailureOrNull(), failure);
      });

      test('returns null for getDataOrNull', () {
        const failure = ServerFailure();
        const result = Result.failure(failure);

        expect(result.getDataOrNull<String>(), null);
        expect(result.getDataOrNull<int>(), null);
      });
    });

    group('when', () {
      test('executes onSuccess callback for success result', () {
        const result = Result.success('success data');

        final output = result.when(
          onSuccess: (data) => 'Success: $data',
          onFailure: (failure) => 'Failure: ${failure.message}',
        );

        expect(output, 'Success: success data');
      });

      test('executes onFailure callback for failure result', () {
        const failure = NetworkFailure(message: 'Network error');
        const result = Result.failure(failure);

        final output = result.when(
          onSuccess: (data) => 'Success: $data',
          onFailure: (failure) => 'Failure: ${failure.message}',
        );

        expect(output, 'Failure: Network error');
      });

      test('can return different types from when callbacks', () {
        const result = Result.success(42);

        final stringOutput = result.when(
          onSuccess: (data) => 'Number is $data',
          onFailure: (failure) => 'Error occurred',
        );

        final intOutput = result.when(
          onSuccess: (data) => (data as int) * 2,
          onFailure: (failure) => 0,
        );

        expect(stringOutput, 'Number is 42');
        expect(intOutput, 84);
      });
    });

    group('type safety', () {
      test('getDataOrNull respects generic type parameter', () {
        const result = Result.success({'key': 'value'});

        final mapData = result.getDataOrNull<Map<String, String>>();
        final wrongTypeData = result.getDataOrNull<List<String>>();

        expect(mapData, {'key': 'value'});
        expect(wrongTypeData, null);
      });

      test('handles complex object types', () {
        final testObject = TestClass('test', 123);
        final result = Result.success(testObject);

        final retrievedObject = result.getDataOrNull<TestClass>();
        expect(retrievedObject, testObject);
        expect(retrievedObject?.name, 'test');
        expect(retrievedObject?.value, 123);
      });
    });
  });
}

class TestClass {
  final String name;
  final int value;

  TestClass(this.name, this.value);
}

