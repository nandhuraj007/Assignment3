import 'package:flutter/material.dart';
class iconButton extends StatelessWidget {
  const iconButton({Key? key, required this.onPressed, required this.iconData, this.color=Colors.white}) : super(key: key);
  final onPressed;
  final iconData;
  final color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 100,
      color: Colors.black,
      child: IconButton(
        color: Colors.white,
        iconSize: 60,
        onPressed: () {  },
        icon: Icon(iconData),
      ),
    );
  }
}
