import 'themes.dart';

abstract class ThemeEvent {}

class ToggleThemeEvent extends ThemeEvent {}

class SetThemeEvent extends ThemeEvent {
  final AppThemeMode themeMode;
  
  SetThemeEvent(this.themeMode);
}
