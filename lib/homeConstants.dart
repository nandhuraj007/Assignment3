import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  CustomButton({ required this.onTap, this.color = Colors.green,  this.icon=Icons.ice_skating});
  final Function onTap;
  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 500,
        width: 500,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60), color: color),
        child: Icon(icon),
      ),
    );
  }
}
class buttons extends StatelessWidget {
  const buttons({Key? key, required this.buttonAction, required this.buttonText}) : super(key: key);
  final Function buttonAction;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      buttonAction;
    },
        child: Text(buttonText));
  }
}

