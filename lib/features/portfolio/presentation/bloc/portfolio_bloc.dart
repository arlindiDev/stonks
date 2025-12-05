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
    
    try {
      final portfolioData = await repository.getPortfolioData();
      emit(PortfolioLoaded(portfolioData: portfolioData));
    } catch (error) {
      emit(PortfolioError(message: error.toString()));
    }
  }

  Future<void> _onRefreshPortfolio(
    RefreshPortfolioEvent event,
    Emitter<PortfolioState> emit,
  ) async {
    try {
      final portfolioData = await repository.getPortfolioData();
      emit(PortfolioLoaded(portfolioData: portfolioData));
    } catch (error) {
      emit(PortfolioError(message: error.toString()));
    }
  }
}
