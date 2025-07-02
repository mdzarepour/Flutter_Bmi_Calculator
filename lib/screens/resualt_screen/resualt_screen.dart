import 'package:bmi_calculator/core/constants/app_strings.dart';
import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/screens/input_screen/components/card_widget.dart';
import 'package:flutter/material.dart';

class ResualtScreen extends StatelessWidget {
  const ResualtScreen({super.key, required this.bmiModel});
  final BmiModel bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.inputAppBarTitle)),
      body: const Center(
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
              width: 500,
              child: InputCardWidget(cardChild: Text('salam')),
            ),
          ],
        ),
      ),
    );
  }
}
