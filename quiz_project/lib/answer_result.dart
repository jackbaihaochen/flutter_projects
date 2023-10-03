import 'package:flutter/material.dart';

import 'package:quiz_project/models/quiz_answer.dart';

class AnswerResult extends StatelessWidget {
  const AnswerResult({
    super.key,
    required this.quizAnswer,
  });

  final QuizAnswer quizAnswer;

  @override
  Widget build(BuildContext context) {
    bool isCorrect = quizAnswer.correctAnswer == quizAnswer.userAnswer;

    return ListTile(
        leading: CircleAvatar(
          backgroundColor: isCorrect ? Colors.lightGreen : Colors.orange,
          foregroundColor: Colors.black,
          child: Text(
            (quizAnswer.questionIndex + 1).toString(),
          ),
        ),
        title: Text(
          quizAnswer.question,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your answer: ${quizAnswer.userAnswer}',
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(50, 0, 0, 0),
              ),
            ),
            Text(
              'Correct answer: ${quizAnswer.correctAnswer}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ));
  }
}
