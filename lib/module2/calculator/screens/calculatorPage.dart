import 'package:assignment/homeConstants.dart';
import 'package:assignment/module2/calculator/constants.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
class calculatorHomePage extends StatefulWidget {
  @override
  _calculatorHomePageState createState() => _calculatorHomePageState();
}
class _calculatorHomePageState extends State<calculatorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        actions: [
          IconButton(
              onPressed: (){
                buttonClick("CLEAR");
              }, icon: Icon(Icons.refresh_rounded))
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                myButton("7"),
                myButton("8"),
                myButton("9"),
                myButton("/"),
              ],
            ),
            Divider(height: 5),
            Row(
              children: <Widget>[
                Divider(height: 5),
                myButton("4"),
                myButton("5"),
                myButton("6"),
                myButton("*"),
              ],
            ),
            Divider(height: 5),
            Row(
              children: <Widget>[
                myButton("1"),
                myButton("2"),
                myButton("3"),
                myButton("-"),
              ],
            ),
            Divider(height: 5),
            Row(
              children: <Widget>[
                myButton("."),
                myButton("0"),
                myButton("00"),
                myButton("+"),
              ],
            ),
            Divider(height: 5),
            Row(
              children: <Widget>[
                Divider(height: 5),
                myButton("CLEAR"),
                myButton("="),
              ],
            ),
            Divider(height: 5),
          ],
        ),
      ),
    );
  }
  Widget myButton(String val) {
    return Expanded(
      child: SizedBox(
        height: 100,
        child: ElevatedButton(
          onPressed: () => buttonClick(val),

          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          child: Text(
            val,
            style: TextStyle(fontSize: 35.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
  late int first, second;
  late String res, text = "";
  late String opp;
  void buttonClick(String btnText) {
    if (btnText == "CLEAR") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      first = int.parse(text);
      res = "";
      opp = btnText;
    } else if (btnText == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      }
      if (opp == "-") {
        res = (first - second).toString();
      }
      if (opp == "x") {
        res = (first * second).toString();
      }
      if (opp == "/") {
        res = (first ~/ second).toString();
      }
    } else {
      res = int.parse(text + btnText).toString();
    }
    setState(() {
      text = res;
    });
  }
}
