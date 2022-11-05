import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment/module2/sqlFliteCrud/db.dart';
class EditStudent extends StatefulWidget {
  int rollno;
  EditStudent({required this.rollno});
  @override
  State<StatefulWidget> createState() {
    return _EditStudent();
  }
}

class _EditStudent extends State<EditStudent> {
  TextEditingController name=TextEditingController();
  TextEditingController rollno=TextEditingController();
  TextEditingController address=TextEditingController();
  StudentDatabase sdb =new StudentDatabase();
  @override
  void initState(){
    sdb.open();
    Future.delayed(Duration(milliseconds: 500),()async{
      var data=await sdb.getStudent(widget.rollno);
      if(data!=null){
        name.text=data["name"];
        rollno.text=data["roll_no"].toString();
        address.text=data["address"];
        setState(() {
        });
      }
      else{
        print("No any data with roll no: " + widget.rollno.toString());
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Student"),
      ),
      body: Column(
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
            ),
              hintText: "Student Name",
            ),
          ),
          TextField(
            controller: rollno,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5)
              ),
              hintText: "Roll No",
            ),
          ),
          TextField(
            controller: address,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5)
              ),
              hintText: "Addresss",
            ),
          ),
          ElevatedButton(
              onPressed: (){
                sdb.db.rawInsert("UPDATE students SET name=?, roll_no=?,address=? WHERE roll_no=?",
                [name.text,rollno.text,address.text,widget.rollno]);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Student data updated")));
              },
              child: Text("Update Student Data"))
        ],
      ),
    );
  }
}
