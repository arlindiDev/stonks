import 'package:equatable/equatable.dart';
import '../../data/mock_data.dart';

abstract class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object?> get props => [];
}

class PortfolioInitial extends PortfolioState {
  const PortfolioInitial();
}

class PortfolioLoading extends PortfolioState {
  const PortfolioLoading();
}

class PortfolioLoaded extends PortfolioState {
  final List<PortfolioUIItem> portfolioData;

  const PortfolioLoaded({required this.portfolioData});

  @override
  List<Object?> get props => [portfolioData];
}

class PortfolioError extends PortfolioState {
  final String message;

  const PortfolioError({required this.message});

  @override
  List<Object?> get props => [message];
}
