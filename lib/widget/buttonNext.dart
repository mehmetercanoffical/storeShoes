import 'package:flutter/material.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';

// ignore: must_be_immutable
class ButtonNext extends StatelessWidget {
  ButtonNext({
    this.press,
    this.title,
    this.isShowIcon,
    this.color,
  });
  Color color;
  bool isShowIcon;
  Function press;
  String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: isShowIcon == null || isShowIcon == false ? blueColor : color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            swidth10,
            Text(
              title,
              style: popiens(context, 16, whiteColor, FontWeight.w600),
            ),
            swidth10,
            isShowIcon == null || isShowIcon == false
                ? SizedBox()
                : Icon(
                    Icons.arrow_right_alt,
                    color: whiteColor,
                  )
          ],
        ),
      ),
    );
  }
}
