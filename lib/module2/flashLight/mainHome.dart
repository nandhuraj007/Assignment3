import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flashlight"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _turnOnFlash(context);
              }, child: Text("Flashlight Turn ON"),),
            ElevatedButton(onPressed: () {
              _turnOffFlash(context);
            }, child: Text("Flashlight Turn OFF")),
          ],
        ),
      ),
    );
  }

  Future<void> _turnOnFlash(BuildContext context) async {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      _showErrorMes('Could not enable Flashlight', context);
    }
  }

  Future<void> _turnOffFlash(BuildContext context) async {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      _showErrorMes('Could not enable Flashlight', context);
    }
  }
  void _showErrorMes(String mes, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(mes)));
  }
}