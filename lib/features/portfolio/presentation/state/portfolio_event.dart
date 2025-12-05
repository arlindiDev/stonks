import 'package:equatable/equatable.dart';

/// Base class for all Portfolio events
abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load portfolio data
class LoadPortfolioEvent extends PortfolioEvent {
  const LoadPortfolioEvent();
}

/// Event to refresh portfolio data
class RefreshPortfolioEvent extends PortfolioEvent {
  const RefreshPortfolioEvent();
}
