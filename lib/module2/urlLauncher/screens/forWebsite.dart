import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ForWebsite extends StatefulWidget {
  const ForWebsite({Key? key}) : super(key: key);

  @override
  State<ForWebsite> createState() => _ForWebsiteState();
}

class _ForWebsiteState extends State<ForWebsite> {
  String _link = '';

  @override
  Widget build(BuildContext context) {
    return Form(
     child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                onChanged: (String text) => _link = text,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    hintText: "enter link",
                    label: Text("Link"),
                    icon: Icon(Icons.email,
                      color: Colors.teal.shade900,)
                )
            ),
          ),
          ElevatedButton(onPressed: (){
            launch('$_link');
          },
              child: Text("Go")
          )
        ],
      ),
     )
    );
  }
}

