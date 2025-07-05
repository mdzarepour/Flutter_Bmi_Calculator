import 'package:bmi_calculator/core/constants/app_strings.dart';
import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/screens/input_screen/components/calculation_button.dart';
import 'package:bmi_calculator/core/widgets/card_widget.dart';
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
    bmiModel = BmiModel(age: 0, gender: Gender.ungender, height: 0, weight: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.inputAppBarTitle)),
      body: Column(
        spacing: 25,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox.shrink(),
          MultiChildInputWidget(
            // male card -->
            leftSideWidget: CardWidget(
              cardColor: bmiModel.gender == Gender.male
                  ? colorScheme.primary
                  : colorScheme.secondary,
              cardChild: GestureDetector(
                onTap: () => genderUpdate(Gender.male),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
            // female card -->
            rightSideWidget: CardWidget(
              cardColor: bmiModel.gender == Gender.female
                  ? colorScheme.primary
                  : colorScheme.secondary,
              cardChild: GestureDetector(
                onTap: () => genderUpdate(Gender.female),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
          // height card -->
          SingleChildInputWidget(
            heightValue: bmiModel.height,
            slider: Slider(
              min: 0,
              max: 200,
              value: bmiModel.height,
              onChanged: (value) => heightUpdate(value),
            ),
          ),
          MultiChildInputWidget(
            // weight card -->
            leftSideWidget: CardWidget(
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
                        onPressed: () => weightUpdate(ChangeType.increase),
                        icon: const Icon(size: 15, Icons.arrow_upward),
                      ),
                      IconButton(
                        onPressed: () => weightUpdate(ChangeType.decrease),
                        icon: const Icon(size: 15, Icons.arrow_downward),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // age card -->
            rightSideWidget: CardWidget(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(style: textTheme.titleMedium, AppStrings.inputAgeLable),
                  Text(style: textTheme.displayLarge, bmiModel.age.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => ageUpdate(ChangeType.increase),
                        icon: const Icon(size: 15, Icons.arrow_upward),
                      ),
                      IconButton(
                        onPressed: () => ageUpdate(ChangeType.decrease),
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

  void genderUpdate(Gender gender) {
    setState(() => bmiModel.updateGender(gender));
  }

  void heightUpdate(double height) {
    setState(() => bmiModel.updateHeight(height));
  }

  void weightUpdate(ChangeType changeType) {
    setState(() => bmiModel.updateWeight(changeType));
  }

  void ageUpdate(ChangeType changeType) {
    setState(() => bmiModel.updateAge(changeType));
  }
}
