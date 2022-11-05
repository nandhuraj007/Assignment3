import 'package:flutter/material.dart';
import 'package:assignment/homeConstants.dart';
class sample extends StatefulWidget {
  const sample({Key? key}) : super(key: key);

  @override
  State<sample> createState() => _sampleState();
}

class _sampleState extends State<sample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
          child: CustomButton(onTap: (){})
      ),
    );
  }
}
