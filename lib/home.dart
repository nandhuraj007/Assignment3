import 'package:assignment/homeConstants.dart';
import 'package:flutter/material.dart';
class mainHome extends StatefulWidget {
  const mainHome({Key? key}) : super(key: key);

  @override
  State<mainHome> createState() => _mainHomeState();
}

class _mainHomeState extends State<mainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment"),
      ),
      body: Column(
        children: const [
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
