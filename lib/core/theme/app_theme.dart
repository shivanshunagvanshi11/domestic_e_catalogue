import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryTeal,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryTeal,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.primaryTeal,
        secondary: AppColors.primaryTeal,
      ),
      useMaterial3: true,
    );
  }
}
