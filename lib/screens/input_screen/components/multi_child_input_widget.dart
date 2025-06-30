import 'package:bmi_calculator/screens/input_screen/components/card_widget.dart';
import 'package:flutter/material.dart';

class MultiChildInputWidget extends StatelessWidget {
  const MultiChildInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 21),
      child: SizedBox(
        height: size.height * 0.22,
        width: size.width,
        child: const Row(
          children: [InputCardWidget(), SizedBox(width: 9), InputCardWidget()],
        ),
      ),
    );
  }
}
