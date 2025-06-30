import 'package:flutter/material.dart';

class InputAppbar extends StatelessWidget {
  const InputAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'BMI Calculator',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
