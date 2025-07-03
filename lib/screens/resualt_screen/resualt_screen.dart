import 'package:bmi_calculator/core/constants/app_strings.dart';
import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/screens/input_screen/components/card_widget.dart';
import 'package:flutter/material.dart';

class ResualtScreen extends StatefulWidget {
  const ResualtScreen({super.key, required this.bmiModel});
  final BmiModel bmiModel;

  @override
  State<ResualtScreen> createState() => _ResualtScreenState();
}

class _ResualtScreenState extends State<ResualtScreen> {
  late final Map<String, dynamic> bmiMap;
  String conditionMessage = 'unKnown';
  @override
  void initState() {
    bmiMap = {
      'gender': widget.bmiModel.gender.name,
      'height': widget.bmiModel.height,
      'weight': widget.bmiModel.weight,
      'age': widget.bmiModel.age,
    };
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
          child: InputCardWidget(
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
                  _calculateBmi(),
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

  String _calculateBmi() {
    double height = bmiMap['height'] / 100;
    double weight = bmiMap['weight'];
    double bmi = weight / (height * height);
    switch (bmi) {
      case < 15:
        conditionMessage = 'Very severely underweight';
        break;
      case > 15 && < 16:
        conditionMessage = '	Severely underweight';
        break;
      case > 16 && < 18.5:
        conditionMessage = 'Underweight';
        break;
      case > 18.5 && < 25:
        conditionMessage = 'Normal (healthy weight)';
        break;
      case > 25 && < 30:
        conditionMessage = 'Overweight';
        break;
      case > 30 && < 35:
        conditionMessage = 'Moderately obese';
        break;
      case > 35 && 40:
        conditionMessage = 'Severely obese';
        break;
      case > 40:
        conditionMessage = 'Very severely obese';
        break;
      default:
        conditionMessage = 'please recheack statics sgain';
    }
    return bmi.toStringAsFixed(2);
  }
}
//TODO refactor imports -->