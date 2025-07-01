import 'package:flutter/material.dart';

class InputCardWidget extends StatelessWidget {
  const InputCardWidget({super.key, required this.cardChild});
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: cardChild,
      ),
    );
  }
}
