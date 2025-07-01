import 'package:bmi_calculator/screens/input_screen/components/card_widget.dart';
import 'package:flutter/material.dart';

//TODO get theme from texttheme -->
class MultiChildInputWidget extends StatelessWidget {
  const MultiChildInputWidget({
    super.key,
    required this.leftSideWidget,
    required this.rightSideWidget,
  });
  final Widget leftSideWidget;
  final Widget rightSideWidget;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 21),
      child: SizedBox(
        height: size.height * 0.22,
        width: size.width,
        child: Row(
          spacing: 15,
          children: [
            Expanded(child: leftSideWidget),
            Expanded(child: rightSideWidget),
          ],
        ),
      ),
    );
  }
}
