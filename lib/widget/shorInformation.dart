import 'package:flutter/material.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';


class ShortInformation extends StatelessWidget {
  final String title;
  final bool isNew;
  final DateTime datetime;

  const ShortInformation({Key key, this.title, this.datetime, this.isNew})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            title + ": ",
            style: popiens(
              context,
              16,
              darkColor.withOpacity(0.8),
              FontWeight.w400,
            ),
          ),
          sheight10,
          Text(
            datetime.toString(),
            style: popiens(
              context,
              16,
              greenColor,
              FontWeight.w600,
            ),
          ),
          swidth10,
        ],
      ),
    );
  }
}
