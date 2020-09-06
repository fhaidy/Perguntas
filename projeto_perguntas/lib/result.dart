import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() onQuestionsReset;
  Result(this.score, this.onQuestionsReset);

  String get resultText {
    if (score < 8) return 'Tente Novamente :(';
    if (score < 12) return 'Bom Trabalho !';
    if (score < 16) return 'Muito Bem !!';
    if (score < 30) return 'Excelente !!!';
    return 'Perfeito !!!!';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            resultText,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: onQuestionsReset,
        )
      ],
    );
  }
}
