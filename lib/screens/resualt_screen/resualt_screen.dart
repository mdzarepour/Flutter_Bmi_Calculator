import 'package:bmi_calculator/data/models/bmi_model.dart';
import 'package:flutter/material.dart';

class ResualtScreen extends StatelessWidget {
  const ResualtScreen({super.key, required this.bmiModel});
  final BmiModel bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(this.bmiModel.age.toString())));
  }
}
