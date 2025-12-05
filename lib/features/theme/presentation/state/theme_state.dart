import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../themes.dart';

class ThemeState {
  final AppThemeMode themeMode;
  
  ThemeState({required this.themeMode});
  
  ThemeData get themeData {
    switch (themeMode) {
      case AppThemeMode.retailBank:
        return AppThemes.retailBankTheme;
      case AppThemeMode.neobank:
        return AppThemes.neobankTheme;
    }
  }
  
  bool get isRetailBank => themeMode == AppThemeMode.retailBank;
  bool get isNeobank => themeMode == AppThemeMode.neobank;
  
  Color get positiveColor {
    return themeMode == AppThemeMode.retailBank 
        ? AppColors.retailPositive 
        : AppColors.neobankPositive;
  }
  
  Color get negativeColor {
    return themeMode == AppThemeMode.retailBank 
        ? AppColors.retailNegative 
        : AppColors.neobankNegative;
  }
  
  Color get positiveBackgroundColor {
    return themeMode == AppThemeMode.retailBank 
        ? AppColors.retailPositiveLight 
        : AppColors.neobankPositiveLight;
  }
  
  Color get negativeBackgroundColor {
    return themeMode == AppThemeMode.retailBank 
        ? AppColors.retailNegativeLight 
        : AppColors.neobankNegativeLight;
  }
  
  Color get chartLineColor {
    return themeMode == AppThemeMode.retailBank 
        ? AppColors.retailChartLine 
        : AppColors.neobankChartLine;
  }
  
  Color get selectedTabColor {
    return themeMode == AppThemeMode.retailBank 
        ? AppColors.retailSelectedTab 
        : AppColors.neobankSelectedTab;
  }
  
  Color get unselectedTabColor {
    return themeMode == AppThemeMode.retailBank 
        ? AppColors.retailUnselectedTab 
        : AppColors.neobankUnselectedTab;
  }
  
  Color get selectedTabTextColor {
    return themeMode == AppThemeMode.retailBank 
        ? AppColors.retailSelectedTabText 
        : AppColors.neobankSelectedTabText;
  }
  
  Color get unselectedTabTextColor {
    return themeMode == AppThemeMode.retailBank 
        ? AppColors.retailUnselectedTabText 
        : AppColors.neobankUnselectedTabText;
  }
  
  Color get textSecondaryColor {
    return themeMode == AppThemeMode.retailBank 
        ? AppColors.retailTextSecondary 
        : AppColors.neobankTextSecondary;
  }
  
  ThemeState copyWith({AppThemeMode? themeMode}) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
