import 'package:bmi_calculator/core/constants/app_strings.dart';
import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/screens/resualt_screen/resualt_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({super.key, required this.bmiModel});
  final BmiModel bmiModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FilledButton(
        style: Theme.of(context).filledButtonTheme.style,
        onPressed: () {
          navigateToResualtScreen(context);
        },
        child: const Text(AppStrings.inputCalculateButtonText),
      ),
    );
  }

  void navigateToResualtScreen(BuildContext context) {
    final route = CupertinoPageRoute(
      builder: (context) => ResualtScreen(bmiModel: bmiModel),
    );
    Navigator.of(context).push(route);
  }
}
