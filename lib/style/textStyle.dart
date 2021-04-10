import 'package:flutter/material.dart';

TextStyle popiens(
  BuildContext context,
  double size,
  Color color,
  FontWeight weight,
) {
  return Theme.of(context).textTheme.headline3.copyWith(
        color: color,
        fontSize: size,
        fontWeight: weight,
      );
}

TextStyle roboto(
  BuildContext context,
  double size,
  Color color,
  FontWeight weight,
) {
  return Theme.of(context).textTheme.headline4.copyWith(
        color: color,
        fontSize: size,
        fontWeight: weight,
      );
}
