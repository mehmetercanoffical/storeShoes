import 'package:flutter/material.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';

// ignore: must_be_immutable
class ButtonNavigatorCenter extends StatelessWidget {
  String title;
  IconData iconData;
  bool isSelected;
  ButtonNavigatorCenter({this.iconData, this.isSelected, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: isSelected
            ? Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      iconData,
                      color: darkColor,
                      size: 24,
                    ),
                    swidth10,
                    Text(
                      title,
                      style: popiens(
                        context,
                        13,
                        darkColor,
                        FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    color: greyColor,
                    size: 22,
                  ),
                ],
              ),
      ),
    );
  }
}
