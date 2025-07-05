import 'package:bmi_calculator/core/constants/app_strings.dart';
import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/core/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class ResualtScreen extends StatelessWidget {
  const ResualtScreen({super.key, required this.bmiModel});
  final BmiModel bmiModel;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.inputAppBarTitle)),
      body: Center(
        child: SizedBox(
          width: size.width * 0.8,
          height: size.height * 0.7,
          child: CardWidget(
            cardChild: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  style: theme.textTheme.displayLarge,
                  AppStrings.resultTitle,
                ),
                Text(
                  style: theme.textTheme.displaySmall,
                  'Gender : ${bmiModel.gender.name}',
                ),
                Text(
                  style: theme.textTheme.displaySmall,
                  'Weight : ${bmiModel.weight.toString()}',
                ),
                Text(
                  style: theme.textTheme.displaySmall,
                  'Height : ${bmiModel.height.toString()}',
                ),
                Text(
                  style: theme.textTheme.displaySmall,
                  'Age : ${bmiModel.age.toString()}',
                ),
                Text(
                  style: theme.textTheme.displayLarge,
                  bmiModel.getCalculatedBmi(),
                ),
                Text(
                  style: theme.textTheme.headlineLarge,
                  bmiModel.getConditionTitle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
