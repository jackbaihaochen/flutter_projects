import 'package:first_app/styled_text.dart';
import 'package:flutter/material.dart';
import 'dart:math';

final random = Random();

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  var diceNumber = 1;

  void onPressed() {
    setState(() {
      diceNumber = random.nextInt(6) + 1;
    });
    print('Roll Dice');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$diceNumber.png',
          height: 200,
        ),
        const SizedBox(height: 16),
        TextButton(
            onPressed: onPressed, child: const StyledText(text: 'Roll Dice')),
      ],
    );
  }
}
