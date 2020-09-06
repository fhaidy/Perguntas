import 'package:flutter/material.dart';
import 'package:projeto_perguntas/question.dart';

import 'answer.dart';

class Questions extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) answerQuestion;

  Questions({
    this.questions,
    this.selectedQuestion,
    this.answerQuestion,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        hasSelectedQuestion ? questions[selectedQuestion]['answers'] : null;
    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]['question']),
        ...answers
            .map((answer) => Answer(
                answer['description'], () => answerQuestion(answer['score'])))
            .toList(),
      ],
    );
  }
}
