import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:store/services/authacation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/services/stream.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './style/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Authacation>(
      create: (_) => Authacation(),
      child: GetMaterialApp(
        title: 'Store App',
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme().darkTheme(),
        themeMode: ThemeMode.system,
        theme: ThemeData(
          accentColor: Colors.white,
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.poppinsTextTheme().copyWith(
            headline3: GoogleFonts.poppins(),
            headline4: GoogleFonts.roboto(),
          ),
        ),
        home: StreamAuthControl(),
      ),
    );
  }
}
