import 'package:flutter/material.dart';
import 'package:quiz_project/answer_button.dart';
import 'package:quiz_project/data/questions.dart';
import 'package:quiz_project/models/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_project/models/quiz_answer.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    required this.addAnswer,
    required this.changeScreen,
    super.key,
  });

  final void Function(QuizAnswer) addAnswer;
  final void Function(String screenName) changeScreen;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void nextQuestion(userAnswer) {
    setState(() {
      widget.addAnswer(
        QuizAnswer(
            questionIndex: currentQuestionIndex,
            question: questions[currentQuestionIndex].question,
            correctAnswer: questions[currentQuestionIndex].answers[0],
            userAnswer: userAnswer),
      );
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        widget.changeScreen('result-screen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestion currentQuestion = questions[currentQuestionIndex];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.question,
            style: GoogleFonts.mooli(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          ...currentQuestion.getShuffledAnswers().map(
                (answer) => AnswerButton(
                  answer: answer,
                  onSelectAnswer: nextQuestion,
                ),
              )
        ],
      ),
    );
  }
}
