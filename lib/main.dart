import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Orange', 'score': 5},
        {'text': 'Red', 'score': 2},
        {'text': 'Yellow', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Dog', 'score': 5},
        {'text': 'Lion', 'score': 2},
        {'text': 'Monkey', 'score': 1},
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 10},
      ]
    },
  ];

  var _questionIndex = 0;
  var _questionsRemaining = true;
  var _totalScore = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Quiz app')),
        body: Container(
          margin: EdgeInsets.all(20),
          child: _questionsRemaining
              ? Quiz(
                  questions: _questions,
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex)
              : Result(_totalScore, _resetQuiz),
        ),
      ),
    );
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    if (_questionIndex == _questions.length) {
      _questionsRemaining = false;
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _questionsRemaining = true;
      _totalScore = 0;
    });
  }
}
