import 'package:flutter/material.dart';

import 'addStudent.dart';
import 'listStudents.dart';
class crudHome extends StatefulWidget {
  const crudHome({Key? key}) : super(key: key);

  @override
  State<crudHome> createState() => _crudHomeState();
}

class _crudHomeState extends State<crudHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(25),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 105,
              ),
              Container(
                height: 100,
                width: 500,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                        return AddStudent();
                      }));
                    },
                    child: Text("Add Student",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 100,
                width: 500,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                        return ListStudents();
                      }));
                    },
                    child: Text("List Deatils",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
