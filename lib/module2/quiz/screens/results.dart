

import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Score ' '$resultScore',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          TextButton(
            onPressed: resetHandler(),
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(14),
              child: const Text(
                'Restart Quiz',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
