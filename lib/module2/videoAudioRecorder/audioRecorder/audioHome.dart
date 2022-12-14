import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'audioList.dart';
import 'audioView.dart';


class HomePage extends StatefulWidget {
  final String _appTitle;

  const HomePage({Key? key, required String title})
      : assert(title != null),
        _appTitle = title,
        super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Directory? appDir;
  late List<String>? records;

  @override
  void initState() {
    super.initState();
    records = [];
    getExternalStorageDirectory().then((value) {
      appDir = value!;
      Directory appDirec = Directory("${appDir!.path}/Audiorecords/");
      appDir = appDirec;
      appDir!.list().listen((onData) {
        records!.add(onData.path);
      }).onDone(() {
        records = records!.reversed.toList();
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    appDir = null;
    records = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: InkWell(child: Icon(Icons.mic),onTap: (){

          show(context);},),
      ),
      appBar: AppBar(
        title: Text(
          widget._appTitle,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Records(
              records: records!,
            ),
          ),

        ],
      ),
    );
  }

  _onFinish() {
    records!.clear();
    print(records!.length.toString());
    appDir!.list().listen((onData) {
      records!.add(onData.path);
    }).onDone(() {
      records!.sort();
      records = records!.reversed.toList();
      setState(() {});
    });
  }

  void show(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white70,
          child: Recorder(
            save: _onFinish,
          ),
        );
      },
    );
  }

}