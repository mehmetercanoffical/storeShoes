import 'package:flutter/material.dart';
import 'package:store/style/color.dart';


class AnimatedContaniner extends StatelessWidget {
  const AnimatedContaniner({
    Key key,
    @required this.isSelected,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 800,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1),
        height: isSelected ? 5 : 5,
        width: isSelected ? 50 : 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
          color: isSelected ? whiteColor : whiteColor.withOpacity(0.6),
        ),
      ),
    );
  }
}