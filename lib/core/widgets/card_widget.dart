import 'package:bmi_calculator/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.cardChild,
    this.cardColor = AppColors.materialThirdBlue,
  });
  final Widget cardChild;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: cardChild,
    );
  }
}
