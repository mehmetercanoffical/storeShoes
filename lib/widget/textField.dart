import 'package:flutter/material.dart';
import 'package:store/style/color.dart';
import 'package:store/style/textStyle.dart';

// ignore: must_be_immutable
class TextFieldCenter extends StatelessWidget {
  String title;
  IconData iconData;
  Function validate;
  Function onSave;
  bool isObs;
  TextInputType type;
  bool complete;

  TextFieldCenter({
    this.complete,
    this.iconData,
    this.isObs,
    this.onSave,
    this.title,
    this.type,
    this.validate,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: double.infinity,
      child: Expanded(
        child: TextFormField(
          validator: validate,
          obscureText: isObs == null || isObs == false ? false : true,
          autofocus: complete == null || complete == false ? false : true,
          style: popiens(context, 17, darkColor, FontWeight.w600),
          onSaved: onSave,
          decoration: InputDecoration(
            prefixIcon: Icon(
              iconData,
              color: darkColor,
            ),
            hintText: title,
            hintStyle: popiens(context, 16, greyColor, FontWeight.normal),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
