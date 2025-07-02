import 'package:bmi_calculator/core/constants/app_strings.dart';
import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/screens/input_screen/components/calculation_button.dart';
import 'package:bmi_calculator/screens/input_screen/components/card_widget.dart';
import 'package:bmi_calculator/screens/input_screen/components/multi_child_input_widget.dart';
import 'package:bmi_calculator/screens/input_screen/components/single_childe_input_widget.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late BmiModel bmiModel;
  @override
  void initState() {
    bmiModel = BmiModel(
      age: 0,
      gender: Gender.ungender,
      height: 0,
      weight: 0.0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.inputAppBarTitle)),
      body: Column(
        spacing: 25,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox.shrink(),
          // gender selection layer -->
          MultiChildInputWidget(
            leftSideWidget: InputCardWidget(
              cardColor: bmiModel.genderSelectionColor(Gender.male),
              cardChild: GestureDetector(
                onTap: () => _genderSelection(Gender.male),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    const Icon(Icons.male),
                    Text(
                      style: textTheme.titleMedium,
                      AppStrings.inputMaleLable,
                    ),
                  ],
                ),
              ),
            ),
            rightSideWidget: InputCardWidget(
              cardColor: bmiModel.genderSelectionColor(Gender.female),
              cardChild: GestureDetector(
                onTap: () => _genderSelection(Gender.female),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    const Icon(Icons.female),
                    Text(
                      style: textTheme.titleMedium,
                      AppStrings.inputFemaleLable,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // height selection layer -->
          SingleChildInputWidget(
            heightValue: bmiModel.height,
            slider: Slider(
              min: 0,
              max: 220,
              value: bmiModel.height,
              onChanged: (value) => heightSelection(value),
            ),
          ),
          // weight and age selection layer -->
          MultiChildInputWidget(
            leftSideWidget: InputCardWidget(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    style: textTheme.titleMedium,
                    AppStrings.inputWeightLable,
                  ),
                  Text(
                    style: textTheme.displayLarge,
                    bmiModel.weight.toString(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => weightSelection(ChangeType.increase),
                        icon: const Icon(size: 15, Icons.arrow_upward),
                      ),
                      IconButton(
                        onPressed: () => weightSelection(ChangeType.decrease),
                        icon: const Icon(size: 15, Icons.arrow_downward),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            rightSideWidget: InputCardWidget(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(style: textTheme.titleMedium, AppStrings.inputAgeLable),
                  Text(style: textTheme.displayLarge, bmiModel.age.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => ageSelection(ChangeType.increase),
                        icon: const Icon(size: 15, Icons.arrow_upward),
                      ),
                      IconButton(
                        onPressed: () => ageSelection(ChangeType.decrease),
                        icon: const Icon(size: 15, Icons.arrow_downward),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(bmiModel: bmiModel),
        ],
      ),
    );
  }

  void _genderSelection(Gender gender) {
    setState(() => bmiModel.gender = gender);
  }

  void heightSelection(double value) {
    setState(() => bmiModel.changeHeight(value));
  }

  void weightSelection(ChangeType type) {
    setState(() => bmiModel.updateWeight(type));
  }

  void ageSelection(ChangeType type) {
    setState(() => bmiModel.updateAge(type));
  }
}
