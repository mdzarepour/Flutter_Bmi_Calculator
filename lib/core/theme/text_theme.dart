import 'package:bmi_calculator/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//TODO get colors from colorcheme -->
class AppTextTheme {
  AppTextTheme._();
  static TextTheme textTheme = TextTheme(
    // appbar text theme -->
    titleLarge: GoogleFonts.inter(
      color: AppColors.materialWhite,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    // gender text theme -->
    titleMedium: GoogleFonts.inter(
      color: AppColors.materialGrey,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    // statics text theme -->
    titleSmall: GoogleFonts.inter(
      color: AppColors.materialGrey,
      fontSize: 20,
      fontWeight: FontWeight.w200,
    ),
    // reualt screen message theme -->
    displaySmall: GoogleFonts.inter(
      color: AppColors.materialGrey,
      fontSize: 35,
      fontWeight: FontWeight.w300,
    ),
    // pink button text theme -->
    displayMedium: GoogleFonts.inter(
      color: AppColors.materialWhite,
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    //numbers text theme -->
    displayLarge: GoogleFonts.inter(
      color: AppColors.materialWhite,
      fontSize: 40,
      fontWeight: FontWeight.w600,
    ),
    // resualt screen green text theme -->
    headlineLarge: GoogleFonts.inter(
      color: AppColors.materialGreen,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  );
}
