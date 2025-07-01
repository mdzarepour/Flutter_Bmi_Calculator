import 'package:bmi_calculator/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum Gender { male, female, ungender }

class BmiModel {
  BmiModel({
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
  });
  Gender gender;
  double height;
  double weight;
  int age;

  // Gender get getSelectedGender {
  //   return gender;
  // }
  Color get femaleSelectioColor {
    if (gender == Gender.female) {
      return AppColors.materialSecondBlue;
    } else {
      return AppColors.materialThirdBlue;
    }
  }

  Color get maleSelectioColor {
    if (gender == Gender.male) {
      return AppColors.materialSecondBlue;
    } else {
      return AppColors.materialThirdBlue;
    }
  }
}
