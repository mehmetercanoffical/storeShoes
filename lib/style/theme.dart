import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/style/color.dart';

class AppTheme {
  ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: MaterialColor(
        0xffCD121F,
        <int, Color>{},
      ),
      brightness: Brightness.light,
      textTheme: GoogleFonts.robotoTextTheme().copyWith(
        headline3: GoogleFonts.poppins(),
        headline4: GoogleFonts.roboto(),
      ),
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: whiteColor,
      brightness: Brightness.dark,
      textTheme: GoogleFonts.robotoTextTheme().copyWith(
        headline3: GoogleFonts.poppins(),
        headline4: GoogleFonts.roboto(),
      ),
    );
  }
}
