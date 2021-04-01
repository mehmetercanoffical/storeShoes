import 'package:flutter/material.dart';
import 'package:store/style/color.dart';


class IconCenter extends StatelessWidget {
  const IconCenter({
    Key key,
    @required this.iconData,
    @required this.press,
    @required this.color,
  }) : super(key: key);

  final IconData iconData;
  final Function press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: trasparentColor,
      highlightColor: trasparentColor,
      onTap: press,
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(
          iconData,
          color: darkColor,
        ),
      ),
    );
  }
}
