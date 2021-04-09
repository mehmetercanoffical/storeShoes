import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/style/color.dart';
import 'package:store/style/textStyle.dart';

class TitleCenter2 extends StatelessWidget {
  final String text;
  const TitleCenter2({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: popiens(
            context,
            21,
            darkColor,
            FontWeight.bold,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(0.7),
          ),
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ],
    );
  }
}
