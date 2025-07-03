import 'package:bmi_calculator/core/constants/app_strings.dart';
import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/core/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class ResualtScreen extends StatefulWidget {
  const ResualtScreen({super.key, required this.bmiModel});
  final BmiModel bmiModel;

  @override
  State<ResualtScreen> createState() => _ResualtScreenState();
}

class _ResualtScreenState extends State<ResualtScreen> {
  late final Map<String, dynamic> bmiMap;
  String conditionMessage = AppStrings.resultDefaultMessage;
  late double _calculatedBmi;

  @override
  void initState() {
    bmiMap = {
      'gender': widget.bmiModel.gender.name,
      'height': widget.bmiModel.height,
      'weight': widget.bmiModel.weight,
      'age': widget.bmiModel.age,
    };
    _calculatedBmi = _calculateBmiValue();
    conditionMessage = _getConditionMessage(_calculatedBmi);
    super.initState();
  }

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
            cardChild: ListView(
              children: [
                const SizedBox(height: 50),
                Text(
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displayLarge,
                  AppStrings.resultTitle,
                ),
                for (int i = 0; i < bmiMap.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      textAlign: TextAlign.center,
                      style: theme.textTheme.displaySmall,
                      '${bmiMap.keys.elementAt(i)} : ${bmiMap.values.elementAt(i)}',
                    ),
                  ),
                const SizedBox(height: 15),
                Text(
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displayLarge,
                  _calculatedBmi.toStringAsFixed(2),
                ),
                const SizedBox(height: 15),
                Text(
                  style: theme.textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                  conditionMessage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _calculateBmiValue() {
    double height = bmiMap['height']! / 100;
    double weight = bmiMap['weight']!;
    return weight / (height * height);
  }

  String _getConditionMessage(double bmi) {
    if (bmi < 18.5) return AppStrings.resultFirstCategory;
    if (bmi < 25) return AppStrings.resultSecondCategory;
    if (bmi < 30) return AppStrings.resultThirdCategory;
    return AppStrings.resultFourthCategory;
  }
}
