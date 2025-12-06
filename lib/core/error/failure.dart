import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final String? code;
  final dynamic originalError;

  const Failure({
    required this.message,
    this.code,
    this.originalError,
  });

  @override
  List<Object?> get props => [message, code];
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'Network connection failed',
    super.code,
    super.originalError,
  });
}

class ServerFailure extends Failure {
  const ServerFailure({
    super.message = 'Server error occurred',
    super.code,
    super.originalError,
  });
}

class DataParsingFailure extends Failure {
  const DataParsingFailure({
    super.message = 'Failed to parse data',
    super.code,
    super.originalError,
  });
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({
    super.message = 'An unexpected error occurred',
    super.code,
    super.originalError,
  });
}
