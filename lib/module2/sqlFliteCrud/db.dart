import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class StudentDatabase{
  late Database db;
  Future open() async{
    var databasePath=await getDatabasesPath();
    String  path=join(databasePath,'demo.db');
     Database db=await openDatabase(path,version: 1,
     onCreate: (Database db, int version)async{
       await db.execute(''' 
       CREATE TABLE IF NOT EXIST students(
       id primary key,
       name varchar(255) not null,
       roll_no int not null,
       address varchar(255) not null
       );
       ''');
    });
  }
  Future<Map<dynamic,dynamic>?> getStudent(int rollno)async{
    List<Map> maps=await db.query('students',where: 'roll_no=?',
    whereArgs: [rollno]);
    if(maps.length>0){//To get student data with roll no
      return maps.first;
    }
    return null;
  }
}