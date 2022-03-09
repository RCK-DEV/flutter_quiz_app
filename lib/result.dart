import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _resultScore;
  final Function _resetHandler;

  Result(this._resultScore, this._resetHandler);

  String get resultPhrase {
    return 'You\'re total score is ' + _resultScore.toString() + '!';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
        FlatButton(
          child: Text('Restart quiz'),
          onPressed: _resetHandler,
          textColor: Colors.blue,
        ),
      ],
    ));
  }
}
