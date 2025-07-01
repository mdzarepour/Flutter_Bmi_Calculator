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
    iconTheme: _getIconTheme(),
    sliderTheme: _getSliderTheme(),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        backgroundColor: AppColors.materialSecondBlue,
      ),
    ),
  );

  static SliderThemeData _getSliderTheme() {
    return const SliderThemeData(
      activeTrackColor: AppColors.materialPink,
      inactiveTrackColor: AppColors.materialWhite,
      trackHeight: 4.0,
      thumbColor: AppColors.materialPink,
      overlayColor: AppColors.materialPink,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
      valueIndicatorColor: AppColors.materialPink,
      valueIndicatorTextStyle: TextStyle(color: Colors.white, fontSize: 14),
    );
  }

  static IconThemeData _getIconTheme() {
    return const IconThemeData(size: 110, color: AppColors.materialWhite);
  }

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
