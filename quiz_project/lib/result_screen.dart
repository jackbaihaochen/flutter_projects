import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_project/models/quiz_answer.dart';
import 'package:quiz_project/answer_result.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    required this.restartQuiz,
    required this.quizAnswers,
    super.key,
  });

  final void Function() restartQuiz;
  final List<QuizAnswer> quizAnswers;

  @override
  Widget build(BuildContext context) {
    int correctAnswerNumber = quizAnswers
        .where(
            (quizAnswer) => quizAnswer.correctAnswer == quizAnswer.userAnswer)
        .length;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answered $correctAnswerNumber out of ${quizAnswers.length} questions correctly!",
            style: GoogleFonts.mooli(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 400,
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...quizAnswers.map(
                      (quizAnswer) => AnswerResult(
                        quizAnswer: quizAnswer,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: restartQuiz,
            icon: const Icon(Icons.restart_alt),
            label: const Text('Restart Quiz!'),
          )
        ],
      ),
    );
  }
}
