import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/style/color.dart';

class SocialMediaSign extends StatelessWidget {
  const SocialMediaSign({
    Key key,
    @required this.iconData,
    @required this.press,
  }) : super(key: key);

  final IconData iconData;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      highlightColor: trasparentColor,
      splashColor: trasparentColor,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: greyColor, width: 1),
        ),
        child: FaIcon(iconData),
      ),
    );
  }
}
