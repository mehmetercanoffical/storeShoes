import 'package:flutter/material.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';




// ignore: must_be_immutable
class TitleCenter extends StatelessWidget {
  String title;
  bool isSelected = true;
  TitleCenter({this.title, this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: isSelected
          ? Row(
              children: [
                swidth10,
                Text(
                  title,
                  style: popiens(
                    context,
                    20,
                    darkColor,
                    FontWeight.w700,
                  ),
                ),
                swidth15,
              ],
            )
          : Row(
              children: [
                Text(
                  title,
                  style: popiens(
                    context,
                    18,
                    darkColor,
                    FontWeight.w200,
                  ),
                ),
                swidth15,
              ],
            ),
    );
  }
}
