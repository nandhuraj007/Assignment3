import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment/module2/sqlFliteCrud/db.dart';
class AddStudent extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AddStudent();
  }
}

class _AddStudent extends State<AddStudent> {
  TextEditingController name=TextEditingController();
  TextEditingController rollno=TextEditingController();
  TextEditingController address=TextEditingController();

  StudentDatabase sdb=new StudentDatabase();
  @override
  void initState(){
    sdb.open();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add student"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                  ),
                  hintText: "Name",
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: rollno,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                hintText: "Roll No"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: address,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                hintText: "Address",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
                onPressed: (){
                  sdb.db.rawInsert("INSERT INTO students(name,roll_no,address) VALUES(?,?,?);",
                  [name.text,rollno.text,address.text]);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Succeesfully addedd")));
                  name.text="";
                  rollno.text="";
                  address.text="";//to clear form after entering data to database
                },
                child: Text("Save Data")
            ),
          )
        ],
      ),
    );
    
  }
}

