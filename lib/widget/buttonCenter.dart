import 'package:flutter/material.dart';
import 'package:store/style/color.dart';
import 'package:store/style/textStyle.dart';

class ButtonCenter extends StatelessWidget {
  String title;
  Function press;
  Color color;
  
  Color textColor;
  ButtonCenter({this.title, this.color, this.press, this.textColor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: trasparentColor,
      splashColor: Colors.grey,
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color.withOpacity(0.8),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: popiens(context, 16, textColor, FontWeight.bold),
        ),
      ),
    );
  }
}
