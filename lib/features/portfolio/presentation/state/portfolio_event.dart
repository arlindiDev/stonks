import 'package:equatable/equatable.dart';

abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object?> get props => [];
}

class LoadPortfolioEvent extends PortfolioEvent {
  const LoadPortfolioEvent();
}

class RefreshPortfolioEvent extends PortfolioEvent {
  const RefreshPortfolioEvent();
}
