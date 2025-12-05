import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';
import 'themes.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeMode: AppThemeMode.retailBank)) {
    on<ToggleThemeEvent>(_onToggleTheme);
    on<SetThemeEvent>(_onSetTheme);
  }
  
  void _onToggleTheme(ToggleThemeEvent event, Emitter<ThemeState> emit) {
    final newTheme = state.themeMode == AppThemeMode.retailBank
        ? AppThemeMode.neobank
        : AppThemeMode.retailBank;
    emit(state.copyWith(themeMode: newTheme));
  }
  
  void _onSetTheme(SetThemeEvent event, Emitter<ThemeState> emit) {
    if (state.themeMode != event.themeMode) {
      emit(state.copyWith(themeMode: event.themeMode));
    }
  }
}
