import 'package:bmi_calculator/core/constants/app_strings.dart';
import 'package:bmi_calculator/screens/input_screen/components/calculation_button.dart';
import 'package:bmi_calculator/screens/input_screen/components/multi_child_input_widget.dart';
import 'package:bmi_calculator/screens/input_screen/components/single_childe_input_widget.dart';
import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.inputAppBarTitle)),
      body: Column(
        spacing: 25,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox.shrink(),
          const MultiChildInputWidget(),
          SingleChildInputWidget(size: size),
          const MultiChildInputWidget(),
          const CalculateButton(),
        ],
      ),
    );
  }
}
