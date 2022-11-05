import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ForWmail extends StatefulWidget {
  const ForWmail({Key? key}) : super(key: key);
  @override
  State<ForWmail> createState() => _ForWmailState();
}
class _ForWmailState extends State<ForWmail> {
  @override
  String _sender = '';
  String _subject='';
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                onChanged: (String text) => _sender = text,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    hintText: "Enter Sender",
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                onChanged: (String text) => _subject = text,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    hintText: "enter subject",
                )
            ),
          ),
          ElevatedButton(onPressed: (){
            launch('mailto:$_sender?subject=$_subject');
          },
              child: Text("Send")
          )
        ],
      ),
    )
    );
  }
}
