import 'package:bmi_calculator/core/constants/app_colors.dart';
import 'package:bmi_calculator/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData theme = ThemeData(
    textTheme: AppTextTheme.textTheme,
    colorScheme: _getColorScheme(),
    appBarTheme: _getAppbarTheme(),
    filledButtonTheme: _getFilledButtonTheme(),
  );

  static FilledButtonThemeData _getFilledButtonTheme() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        textStyle: AppTextTheme.textTheme.displayMedium,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(0)),
        ),
        backgroundColor: AppColors.materialSecondBlue,
      ),
    );
  }

  static AppBarTheme _getAppbarTheme() {
    return AppBarTheme(
      toolbarHeight: 50,
      backgroundColor: AppColors.materialSecondBlue,
      titleTextStyle: AppTextTheme.textTheme.titleLarge,
      centerTitle: true,
    );
  }

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
