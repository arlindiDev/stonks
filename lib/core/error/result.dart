import 'failure.dart';

class Result {
  final Failure? failure;
  final Object? data;

  const Result._({
    this.failure,
    this.data,
  });

  const Result.success(Object data) : this._(data: data);

  const Result.failure(Failure failure) : this._(failure: failure);

  bool get isSuccess => failure == null && data != null;

  bool get isFailure => failure != null;

  T? getDataOrNull<T>() {
    if (isSuccess && data is T) {
      return data as T;
    }
    return null;
  }

  Failure? getFailureOrNull() => failure;

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

