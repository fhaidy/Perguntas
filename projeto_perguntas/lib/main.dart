import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questions.dart';
import 'package:projeto_perguntas/result.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'question': 'Qual sua cor favorita?',
      'answers': [
        {'description': 'Preto', 'score': 10},
        {'description': 'Vermelho', 'score': 5},
        {'description': 'Azul', 'score': 3},
        {'description': 'Verde', 'score': 1},
      ]
    },
    {
      'question': 'Qual seu animal favorito?',
      'answers': [
        {'description': 'Sapo', 'score': 10},
        {'description': 'Gato', 'score': 5},
        {'description': 'Cachorro', 'score': 3},
        {'description': 'Elefante', 'score': 1},
      ]
    },
    {
      'question': 'Qual seu professor favorito?',
      'answers': [
        {'description': 'João', 'score': 10},
        {'description': 'Maria', 'score': 5},
        {'description': 'Pedro', 'score': 3},
        {'description': 'Lucas', 'score': 1},
      ]
    }
  ];
  void _onAnswer(int score) {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
    }
  }

  void _resetQuestions() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: hasSelectedQuestion
            ? Questions(
                questions: _questions,
                selectedQuestion: _selectedQuestion,
                answerQuestion: _onAnswer,
              )
            : Result(_totalScore, _resetQuestions),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
