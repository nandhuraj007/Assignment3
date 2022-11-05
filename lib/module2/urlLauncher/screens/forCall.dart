import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ForCall extends StatefulWidget {
  const ForCall({Key? key}) : super(key: key);

  @override
  State<ForCall> createState() => _ForCallState();
}

class _ForCallState extends State<ForCall> {
  String _phone = '';
  Future<void>? _launched;
  @override
  Widget build(BuildContext context) {
    return  Form(
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
                 ElevatedButton(
                    onPressed: () => setState(() {
                    launch('tel:+$_phone');
                  }
                ),
                child: Icon(Icons.call)
              ),
        ],
      ),
      )
    );
  }
}


