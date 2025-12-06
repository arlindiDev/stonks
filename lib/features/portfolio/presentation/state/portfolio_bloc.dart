import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repository/portfolio_repository.dart';
import 'portfolio_event.dart';
import 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final PortfolioRepository repository;

  PortfolioBloc({required this.repository}) : super(const PortfolioInitial()) {
    on<LoadPortfolioEvent>(_onLoadPortfolio);
    on<RefreshPortfolioEvent>(_onRefreshPortfolio);
  }

  Future<void> _onLoadPortfolio(
    LoadPortfolioEvent event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(const PortfolioLoading());
    
    final result = await repository.getPortfolioData();
    
    if (result.isSuccess) {
      final data = result.getDataOrNull();
      if (data != null) {
        emit(PortfolioLoaded(portfolioData: data));
      }
    } else if (result.isFailure) {
      final failure = result.getFailureOrNull();
      if (failure != null) {
        emit(PortfolioError(message: failure.message));
      }
    }
  }

  Future<void> _onRefreshPortfolio(
    RefreshPortfolioEvent event,
    Emitter<PortfolioState> emit,
  ) async {
    final result = await repository.getPortfolioData();
    
    if (result.isSuccess) {
      final data = result.getDataOrNull();
      if (data != null) {
        emit(PortfolioLoaded(portfolioData: data));
      }
    } else if (result.isFailure) {
      final failure = result.getFailureOrNull();
      if (failure != null) {
        emit(PortfolioError(message: failure.message));
      }
    }
  }
}
