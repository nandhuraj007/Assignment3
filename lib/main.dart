import 'package:assignment/sample.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'module2/calculator/screens/calculatorPage.dart';
import 'module2/sqlFliteCrud/mainPage.dart';
import 'module2/toDo/toDoHome.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home:   TodoApp()
    );
  }
}

