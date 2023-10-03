import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({required this.changeScreen, super.key});

  final void Function(String screenName) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
        ),
        const SizedBox(height: 80),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        OutlinedButton(
          onPressed: () {
            changeScreen('questions-screen');
          },
          child: const Text(
            'Start Quiz',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
