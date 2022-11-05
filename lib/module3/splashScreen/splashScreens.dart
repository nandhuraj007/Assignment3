import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SplashScreen(
        seconds: 6,
        navigateAfterSeconds: new SecondScreen(),
        backgroundColor: Colors.black,
        title: Text('Alone, we can do so little;\ntogether, we can do so much\n                              Helen Keller',
            style: TextStyle(fontSize: 30.0,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = const LinearGradient(
                  colors: <Color>[
                    Colors.pinkAccent,
                    Colors.deepPurpleAccent,
                    Colors.red
                  ],
                ).createShader(Rect.fromLTWH(10.0, 0.0, 200.0, 100.0)
                )
            )
        ),
        image: Image.asset('assets/images/mylogo.png'),
        loadingText: const Text(" Loading",
          style: TextStyle(
              fontSize: 19,
              fontWeight:FontWeight.bold
          ),
        ),
        useLoader: true,
        photoSize: 200.0,
        loaderColor: Colors.teal,
      ),
    );
  }
}
class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Screen Example"),
      ),
      body: Center(
        child: Text("Second Screen",style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
