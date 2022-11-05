import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_for_community/Examples/LoginPageEx.dart';
import 'package:social_media_for_community/Screens/routingPage.dart';
class HomePageExample extends StatefulWidget {
  const HomePageExample({Key? key}) : super(key: key);

  @override
  State<HomePageExample> createState() => _HomePageExampleState();
}

class _HomePageExampleState extends State<HomePageExample> {
  SharedPreferences? loginPreference;
  String? userName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
  }

  Future <void> getUsername() async
  {
    loginPreference= await SharedPreferences.getInstance() ;
    setState(() {
      userName=loginPreference?.getString('userName');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 405,),
            Text("Username ${userName}",style: TextStyle(fontSize: 16),),
            const SizedBox(height: 15,),
            SizedBox(
              height: 30,
              width: 100,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginEx()));
              },
                  child: const Text("Logout")),
            )
          ],
        ),
      ),

    );
  }
}
