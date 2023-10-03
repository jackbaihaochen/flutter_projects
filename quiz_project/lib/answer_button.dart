import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required this.answer,
    required this.onSelectAnswer,
    super.key,
  });

  final String answer;
  final void Function(String userAnswer) onSelectAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(10, 0, 0, 0),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 40,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          onSelectAnswer(answer);
        },
        child: Text(
          answer,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
