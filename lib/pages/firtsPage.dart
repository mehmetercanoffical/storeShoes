import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/pages/auth/login.dart';
import 'package:store/pages/auth/signup.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';
import 'package:store/widget/buttonCenter.dart';

class FirtsPage extends StatefulWidget {
  @override
  _FirtsPageState createState() => _FirtsPageState();
}

class _FirtsPageState extends State<FirtsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/page.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPaddingHorizontal,
              vertical: kPaddingVertical,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  context,
                  text: "Buy & Sell Authantic",
                  color: whiteColor,
                  size: 16,
                ),
                sheight10,
                Text("X-S-STORE",
                    style: popiens(
                      context,
                      45,
                      whiteColor,
                      FontWeight.bold,
                    )),
                sheight10,
                buildText(
                  context,
                  text: "Real Time\nMakret Pricing",
                  color: whiteColor,
                  size: 18,
                ),
                Spacer(),
                ButtonCenter(
                  color: whiteColor,
                  press: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => SingUpPage(),
                        ));
                  },
                  textColor: darkColor,
                  title: "Sign Up",
                ),
                sheight5,
                ButtonCenter(
                  color: redOpacityColor,
                  press: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  textColor: whiteColor,
                  title: "Sign In",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text buildText(BuildContext context,
      {String text, Color color, double size}) {
    return Text(
      text,
      style: popiens(
        context,
        size,
        color,
        FontWeight.normal,
      ),
    );
  }
}
