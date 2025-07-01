import 'package:bmi_calculator/core/constants/app_colors.dart';
import 'package:bmi_calculator/core/constants/app_strings.dart';
import 'package:bmi_calculator/data/dummy_data/dummy_bmi.dart';
import 'package:bmi_calculator/data/models/bmi_model.dart';
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
  double _heightValue = 0.0;
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
          MultiChildInputWidget(
            leftSideWidget: InputCardWidget(
              cardColor: bmiModel.maleSelectioColor,
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
              cardColor: bmiModel.femaleSelectioColor,
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
          SingleChildInputWidget(
            heightValue: _heightValue,
            slider: Slider(
              min: 0,
              max: 220,
              value: _heightValue,
              onChanged: (value) => setState(() => _heightValue = value),
              onChangeEnd: (value) => bmiModel.height = value,
            ),
          ),
          MultiChildInputWidget(
            leftSideWidget: InputCardWidget(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    style: textTheme.titleMedium,
                    AppStrings.inputWeightLable,
                  ),
                  Text(style: textTheme.displayLarge, '60'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(size: 15, Icons.arrow_upward),
                      ),
                      IconButton(
                        onPressed: () {},
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
                  Text(style: textTheme.displayLarge, '19'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(size: 15, Icons.arrow_upward),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(size: 15, Icons.arrow_downward),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const CalculateButton(),
        ],
      ),
    );
  }

  void _genderSelection(Gender gender) {
    setState(() => bmiModel.gender = gender);
  }
}
