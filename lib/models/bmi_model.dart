import 'dart:math';

import 'package:bmi_calculator/core/imports/import_core.dart';

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
  late double bmi;

  void updateGender(Gender selectedGender) => gender = selectedGender;

  void updateHeight(double value) => height = value.ceilToDouble();

  void updateWeight(ChangeType type) {
    if (type == ChangeType.increase) weight += 0.5;
    if (type == ChangeType.decrease) if (weight > 0) weight -= 0.5;
  }

  void updateAge(ChangeType type) {
    if (type == ChangeType.increase) age += 1;
    if (type == ChangeType.decrease) if (age > 0) age -= 1;
  }

  String getCalculatedBmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(2);
  }

  String getConditionTitle() {
    if (bmi >= 25) {
      return AppStrings.resultThirdCategory;
    } else if (bmi > 18.5) {
      return AppStrings.resultSecondCategory;
    } else {
      return AppStrings.resultFirstCategory;
    }
  }
}
