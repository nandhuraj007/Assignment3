import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ForSMS extends StatefulWidget {
  const ForSMS({Key? key}) : super(key: key);

  @override
  State<ForSMS> createState() => _ForSMSState();
}

class _ForSMSState extends State<ForSMS> {
  @override
  String _phone = '';
  String _message='';
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                onChanged: (String text) => _phone = text,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    hintText: "enter phone number",
                    label: Text("Phone no"),
                    icon: Icon(Icons.email,
                      color: Colors.teal.shade900,)
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                onChanged: (String text) => _message = text,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    hintText: "enter message",
                    label: Text("Message"),
                    icon: Icon(Icons.email,
                      color: Colors.teal.shade900,)
                )
            ),
          ),
          ElevatedButton(onPressed: (){
            launch('sms:+$_phone?body=$_message');
          },
              child: Text("Send")
          )
        ],
      ),
    )
    );
  }
}
