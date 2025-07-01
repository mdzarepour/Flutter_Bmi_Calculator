import 'package:bmi_calculator/core/constants/app_colors.dart';
import 'package:bmi_calculator/core/constants/app_strings.dart';
import 'package:bmi_calculator/screens/input_screen/components/calculation_button.dart';
import 'package:bmi_calculator/screens/input_screen/components/card_widget.dart';
import 'package:bmi_calculator/screens/input_screen/components/multi_child_input_widget.dart';
import 'package:bmi_calculator/screens/input_screen/components/single_childe_input_widget.dart';
import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  const Icon(Icons.male),
                  Text(style: textTheme.titleMedium, 'Male'),
                ],
              ),
            ),
            rightSideWidget: InputCardWidget(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  const Icon(Icons.female),
                  Text(style: textTheme.titleMedium, 'Female'),
                ],
              ),
            ),
          ),
          SingleChildInputWidget(
            heightValue: 150,
            slider: Slider(value: 0, onChanged: (value) {}),
          ),
          MultiChildInputWidget(
            leftSideWidget: InputCardWidget(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                spacing: 5,
                children: [
                  Text(style: textTheme.titleMedium, 'Weight'),
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
                        icon: const Icon(size: 15, Icons.arrow_upward),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            rightSideWidget: InputCardWidget(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                spacing: 5,
                children: [
                  Text(style: textTheme.titleMedium, 'Age'),
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
}
