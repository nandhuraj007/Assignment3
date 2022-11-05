import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
class TextToSpeech extends StatefulWidget {
  const TextToSpeech({Key? key}) : super(key: key);
  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  final FlutterTts tts = FlutterTts();
  final TextEditingController controller = TextEditingController(text: 'Hello ');
  TextToSpeech(){
    tts.setLanguage('mal');
    tts.setSpeechRate(20);
    tts.setVolume(0.5);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
          ),
          ElevatedButton(onPressed: (){
            tts.speak(controller.text);
          }, child: Text('Speak'))
        ],
      ),
    );
  }
}
