import 'package:bmi_calculator/core/theme/app_theme.dart';
import 'package:bmi_calculator/screens/input_screen/input_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const InputPage(),
    );
  }
}
