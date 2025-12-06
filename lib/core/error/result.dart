import 'failure.dart';

/// A result wrapper that contains either a failure or success data.
/// This is a concrete implementation without generics.
class Result {
  final Failure? failure;
  final Object? data;

  const Result._({
    this.failure,
    this.data,
  });

  /// Creates a success result with data
  const Result.success(Object data) : this._(data: data);

  /// Creates a failure result with an error
  const Result.failure(Failure failure) : this._(failure: failure);

  /// Returns true if this result represents a success
  bool get isSuccess => failure == null && data != null;

  /// Returns true if this result represents a failure
  bool get isFailure => failure != null;

  /// Returns the data if available, null otherwise
  T? getDataOrNull<T>() {
    if (isSuccess && data is T) {
      return data as T;
    }
    return null;
  }

  /// Returns the failure if available, null otherwise
  Failure? getFailureOrNull() => failure;

  /// Executes one of the callbacks based on success or failure
  T when<T>({
    required T Function(Object data) onSuccess,
    required T Function(Failure failure) onFailure,
  }) {
    if (isSuccess && data != null) {
      return onSuccess(data!);
    } else if (failure != null) {
      return onFailure(failure!);
    }
    throw Exception('Result is in an invalid state');
  }
}
