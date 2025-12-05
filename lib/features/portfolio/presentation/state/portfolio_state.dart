import 'package:equatable/equatable.dart';
import '../../data/mock_data.dart';

/// Base class for all Portfolio states
abstract class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object?> get props => [];
}

/// Initial state before loading
class PortfolioInitial extends PortfolioState {
  const PortfolioInitial();
}

/// State when portfolio data is being loaded
class PortfolioLoading extends PortfolioState {
  const PortfolioLoading();
}

/// State when portfolio data has been successfully loaded
class PortfolioLoaded extends PortfolioState {
  final List<PortfolioUIItem> portfolioData;

  const PortfolioLoaded({required this.portfolioData});

  @override
  List<Object?> get props => [portfolioData];
}

/// State when an error occurs while loading portfolio data
class PortfolioError extends PortfolioState {
  final String message;

  const PortfolioError({required this.message});

  @override
  List<Object?> get props => [message];
}
