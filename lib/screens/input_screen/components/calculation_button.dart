import 'package:bmi_calculator/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FilledButton(
        style: Theme.of(context).filledButtonTheme.style,
        onPressed: () {},
        child: const Text(AppStrings.inputCalculateButtonText),
      ),
    );
  }
}
