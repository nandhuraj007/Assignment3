import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_for_community/Screens/routingPage.dart';

import 'homePageEx.dart';
class LoginEx extends StatefulWidget {
  const LoginEx({Key? key}) : super(key: key);

  @override
  State<LoginEx> createState() => _LoginExState();
}

class _LoginExState extends State<LoginEx> {
  SharedPreferences? loginPreference;
  //late String userName;
  bool? loginUser;//To check wether the user is new or existing
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAccount();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    //super.dispose();
    userController.dispose();
    passwordController.dispose();
  }
  void checkAccount()async{//method to check the user is new or existing
    loginPreference = await SharedPreferences.getInstance();//reference variable for sharedPrefernece object
    loginUser=(loginPreference?.getBool('login')??true);
    if(loginUser==false){
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePageExample()));
    }
    print("$loginUser");
  }
  final userController=TextEditingController();
  final passwordController=TextEditingController();
  final _formGlobalKey = GlobalKey <FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formGlobalKey,
        child: Column(
          children: [
            const SizedBox(height: 170,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Login",style: TextStyle(fontSize: 20),),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(bottom: 10,left: 40,right: 40),
              child: TextFormField(
                controller: userController,
                decoration: const InputDecoration(
                    label: Text("Email"),
                    hintText: 'Enter email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only()
                    )
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Required Field ';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 10,left: 40,right: 40),
              child: TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    label: Text("Password"),
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only()
                    )
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Required Field';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 300,right: 0,bottom: 5),
              child: TextButton(
                  onPressed: (){}, child: const Text(
                "Forget Password",
                style: TextStyle(
                    fontSize: 15,color: Colors.blue),)

              ),
            ),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(onPressed: (){
                if(_formGlobalKey.currentState!.validate()){
                  String userName=userController.text;
                  String password=passwordController.text;
                  loginPreference?.setBool('login', false);
                  loginPreference?.setString('userName', userName);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageExample()));
                }
              },
                  child: const Text("Login")),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'No account yet ?',
                        style: const TextStyle(
                            color: Colors.red, fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: ' Create One',
                              style: TextStyle(
                                  color: Colors.blueAccent.shade700,
                                  fontSize: 20),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {

                                }
                          )
                        ]
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
