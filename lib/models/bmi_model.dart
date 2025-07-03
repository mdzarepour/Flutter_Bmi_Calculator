import 'package:bmi_calculator/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum Gender { male, female, ungender }

enum ChangeType { increase, decrease }

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

  Color genderSelectionColor(Gender selectedGender) {
    return gender == selectedGender
        ? AppColors.materialSecondBlue
        : AppColors.materialThirdBlue;
  }

  void changeHeight(double value) => height = value.ceilToDouble();

  void updateWeight(ChangeType type) {
    if (type == ChangeType.increase) weight += 0.5;
    if (type == ChangeType.decrease) if (weight > 0) weight -= 0.5;
  }

  void updateAge(ChangeType type) {
    if (type == ChangeType.increase) age += 1;
    if (type == ChangeType.decrease) if (age > 0) age -= 1;
  }
}
