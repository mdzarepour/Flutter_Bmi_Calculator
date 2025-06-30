import 'package:bmi_calculator/screens/input_screen/components/card_widget.dart';
import 'package:flutter/material.dart';

class SingleChildInputWidget extends StatelessWidget {
  const SingleChildInputWidget({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 21),
      child: SizedBox(
        height: size.height * 0.22,
        width: size.width,
        child: const InputCardWidget(),
      ),
    );
  }
}
