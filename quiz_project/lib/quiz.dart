import 'package:flutter/material.dart';

import 'package:quiz_project/start_screen.dart';
import 'package:quiz_project/questions_screen.dart';
import 'package:quiz_project/result_screen.dart';

import 'package:quiz_project/models/quiz_answer.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String currentScreen = 'start-screen';
  List<QuizAnswer> quizAnswers = [];

  void addAnswer(QuizAnswer answer) {
    setState(() {
      quizAnswers.add(answer);
    });
  }

  void changeScreen(String screenName) {
    setState(() {
      currentScreen = screenName;
    });
  }

  void restartQuiz() {
    setState(() {
      quizAnswers = [];
      currentScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget displayedScreen;
    if (currentScreen == 'start-screen') {
      displayedScreen = StartScreen(changeScreen: changeScreen);
    } else if (currentScreen == 'questions-screen') {
      displayedScreen = QuestionsScreen(
        addAnswer: addAnswer,
        changeScreen: changeScreen,
      );
    } else if (currentScreen == 'result-screen') {
      displayedScreen = ResultScreen(
        restartQuiz: restartQuiz,
        quizAnswers: quizAnswers,
      );
    } else {
      displayedScreen = StartScreen(changeScreen: changeScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.yellow, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: displayedScreen,
            ),
          ),
        ),
      ),
    );
  }
}
