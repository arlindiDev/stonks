import '../../../../core/error/failure.dart';
import '../entities/portfolio_ui_item.dart';

class PortfolioResult {
  final Failure? failure;
  final List<PortfolioUIItem>? data;

  const PortfolioResult._({
    this.failure,
    this.data,
  });

  const PortfolioResult.success(List<PortfolioUIItem> data)
      : this._(data: data);

  const PortfolioResult.failure(Failure failure) : this._(failure: failure);

  bool get isSuccess => failure == null && data != null;

  bool get isFailure => failure != null;

  List<PortfolioUIItem>? getDataOrNull() => data;

  Failure? getFailureOrNull() => failure;

  T when<T>({
    required T Function(List<PortfolioUIItem> data) onSuccess,
    required T Function(Failure failure) onFailure,
  }) {
    if (isSuccess && data != null) {
      return onSuccess(data!);
    } else if (failure != null) {
      return onFailure(failure!);
    }
    throw Exception('PortfolioResult is in an invalid state');
  }
}
