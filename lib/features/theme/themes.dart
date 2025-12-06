import 'package:flutter/material.dart';
import '../../core/ui/colors.dart';

enum AppThemeMode {
  retailBank,
  neobank,
}

class AppThemes {
  static ThemeData get retailBankTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      
      colorScheme: const ColorScheme.light(
        primary: AppColors.retailPrimary,
        secondary: AppColors.retailAccent,
        error: AppColors.retailNegative,
        onSecondary: Colors.white,
        onSurface: AppColors.retailTextPrimary,
      ),
      
      scaffoldBackgroundColor: AppColors.retailBackground,
      
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.retailPrimary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      
      cardTheme: CardThemeData(
        color: AppColors.retailCardBackground,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.retailTextPrimary,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: AppColors.retailTextPrimary,
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          color: AppColors.retailTextSecondary,
          fontSize: 12,
        ),
        titleLarge: TextStyle(
          color: AppColors.retailTextPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        titleMedium: TextStyle(
          color: AppColors.retailTextPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      
      dividerColor: AppColors.retailDivider,
    );
  }
  
  // Neobank Theme (Dark/Neon)
  static ThemeData get neobankTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      
      colorScheme: const ColorScheme.dark(
        primary: AppColors.neobankPrimary,
        secondary: AppColors.neobankAccent,
        surface: AppColors.neobankSurface,
        error: AppColors.neobankNegative,
        onPrimary: AppColors.neobankBackground,
        onSecondary: AppColors.neobankBackground,
        onError: Colors.white,
      ),
      
      scaffoldBackgroundColor: AppColors.neobankBackground,
      
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.neobankSurface,
        foregroundColor: AppColors.neobankPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: AppColors.neobankPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      
      cardTheme: CardThemeData(
        color: AppColors.neobankCardBackground,
        elevation: 4,
        shadowColor: AppColors.neobankPrimary.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: AppColors.neobankPrimary.withValues(alpha: 0.2),
          ),
        ),
      ),
      
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.neobankTextPrimary,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: AppColors.neobankTextPrimary,
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          color: AppColors.neobankTextSecondary,
          fontSize: 12,
        ),
        titleLarge: TextStyle(
          color: AppColors.neobankTextPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        titleMedium: TextStyle(
          color: AppColors.neobankTextPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      
      dividerColor: AppColors.neobankDivider,
    );
  }
  
  AppThemes._();
}
