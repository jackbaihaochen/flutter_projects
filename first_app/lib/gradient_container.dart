import 'package:flutter/material.dart';
import 'package:first_app/roll_dice.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {this.colors = const [Colors.red, Colors.yellow], super.key});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: RollDice(),
      ),
    );
  }
}
