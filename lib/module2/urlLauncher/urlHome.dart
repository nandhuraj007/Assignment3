import 'package:flutter/material.dart';
class urlHomes extends StatefulWidget {
  const urlHomes({Key? key}) : super(key: key);

  @override
  State<urlHomes> createState() => _urlHomesState();
}

class _urlHomesState extends State<urlHomes> {
  var selectedItem = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
        actions: [
          PopupMenuButton(onSelected: (value) {
            setState(() {
              selectedItem = value.toString();
            });
            print(value);
            Navigator.pushNamed(context, value.toString());
          }, itemBuilder: (BuildContext bc) {
            return const [
              PopupMenuItem(
                child: Text("Call"),
                value: '/calls',
              ),
              PopupMenuItem(
                child: Text("Sms"),
                value: '/sms',
              ),
              PopupMenuItem(
                child: Text("Mail"),
                value: '/mails',
              ),
              PopupMenuItem(
                child: Text("web"),
                value: '/webs',
              )
            ];
          })
        ],
      ),
      body: Center(
        child: Text(selectedItem),
      ),
    );
  }
}
