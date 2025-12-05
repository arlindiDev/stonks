import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repository/portfolio_repository.dart';
import 'portfolio_event.dart';
import 'portfolio_state.dart';

/// BLoC for managing portfolio state
class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final PortfolioRepository repository;

  PortfolioBloc({required this.repository}) : super(const PortfolioInitial()) {
    on<LoadPortfolioEvent>(_onLoadPortfolio);
    on<RefreshPortfolioEvent>(_onRefreshPortfolio);
  }

  /// Handles loading portfolio data
  Future<void> _onLoadPortfolio(
    LoadPortfolioEvent event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(const PortfolioLoading());
    
    try {
      final portfolioData = await repository.getPortfolioData();
      emit(PortfolioLoaded(portfolioData: portfolioData));
    } catch (error) {
      emit(PortfolioError(message: error.toString()));
    }
  }

  /// Handles refreshing portfolio data
  Future<void> _onRefreshPortfolio(
    RefreshPortfolioEvent event,
    Emitter<PortfolioState> emit,
  ) async {
    // Keep current data while refreshing
    try {
      final portfolioData = await repository.getPortfolioData();
      emit(PortfolioLoaded(portfolioData: portfolioData));
    } catch (error) {
      emit(PortfolioError(message: error.toString()));
    }
  }
}
