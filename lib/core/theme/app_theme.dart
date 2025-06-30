import 'package:bmi_calculator/core/constants/app_colors.dart';
import 'package:bmi_calculator/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData theme = ThemeData(
    textTheme: AppTextTheme.textTheme,
    colorScheme: _getColorScheme(),
  );
  static ColorScheme _getColorScheme() {
    return const ColorScheme.dark(
      brightness: Brightness.dark,
      surface: AppColors.materialFirstBlue,
      onSurface: AppColors.materialWhite,
      primary: AppColors.materialSecondBlue,
      onPrimary: AppColors.materialWhite,
      secondary: AppColors.materialThirdBlue,
      onSecondary: AppColors.materialWhite,
      primaryContainer: AppColors.materialPink,
      onPrimaryContainer: AppColors.materialWhite,
    );
  }
}
