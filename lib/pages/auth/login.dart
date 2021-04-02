import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/users.dart';
import 'package:store/pages/auth/signup.dart';
import 'package:store/services/authacation.dart';
import 'package:store/services/cloud.dart';
import 'package:store/services/stream.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';
import 'package:store/widget/socialMediaAuth.dart';
import 'package:store/widget/textField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final key = GlobalKey<FormState>();
  final scfKey = GlobalKey<ScaffoldState>();
  String email, password;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scfKey,
      body: Container(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Form(
              key: key,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kPaddingHorizontal,
                  vertical: kPaddingVertical,
                ),
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            sheight40,
                            Text(
                              "Welcome Back",
                              style: popiens(
                                  context, 25, darkColor, FontWeight.bold),
                            ),
                            Text("Sign In width Social Media or Fill to Form"),
                            sheight10,
                            sheight20,
                            Row(
                              children: [
                                SocialMediaSign(
                                    iconData: FontAwesomeIcons.facebook,
                                    press: () {}),
                                swidth10,
                                SocialMediaSign(
                                    iconData: FontAwesomeIcons.google,
                                    press: getGoogleWidth),
                              ],
                            ),
                            sheight20,
                            TextFieldCenter(
                              title: "Email",
                              complete: true,
                              iconData: Icons.email,
                              isObs: false,
                              onSave: (value) {
                                email = value;
                              },
                              validate: (value) {
                                if (value.isEmpty) {
                                  return "You are use add email label";
                                } else if (!value.contains("@")) {
                                  return "You are email not true";
                                }
                                return null;
                              },
                              type: TextInputType.emailAddress,
                            ),
                            sheight10,
                            TextFieldCenter(
                              title: "Password",
                              complete: false,
                              iconData: Icons.lock,
                              isObs: true,
                              onSave: (value) {
                                password = value;
                              },
                              validate: (value) {
                                if (value.isEmpty) {
                                  return "You are use add password label";
                                } else if (value.trim().length < 6) {
                                  return "You are Wrong password";
                                }
                                return null;
                              },
                              type: TextInputType.visiblePassword,
                            ),
                            sheight40,
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: getSingIn,
                                child: Container(
                                  height: 70,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: blueColor,
                                  ),
                                  child: isLoading
                                      ? CircularProgressIndicator()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Sign In",
                                              style: popiens(context, 16,
                                                  whiteColor, FontWeight.w600),
                                            ),
                                            swidth5,
                                            Icon(
                                              Icons.arrow_right_alt,
                                              color: whiteColor,
                                            )
                                          ],
                                        ),
                                ),
                              ),
                            ),
                            //Spacer(),
                            sheight20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Haven't you Account "),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => SingUpPage(),
                                        ));
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: popiens(
                                      context,
                                      13,
                                      redOpacityColor,
                                      FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  Future<Users> getSingIn() async {
    final provider = Provider.of<Authacation>(context, listen: false);

    if (key.currentState.validate()) {
      key.currentState.save();
      setState(() {
        isLoading = true;
      });
      try {
        await provider.singIn(email, password);
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => StreamAuthControl(),
            ));
      } catch (e) {
        getErrorMessage(errorCode: e.code);
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  // ignore: missing_return
  Future<Users> getGoogleWidth() async {
    final provider = Provider.of<Authacation>(context, listen: false);

    try {
      setState(() {
        isLoading = true;
      });
      Users user = await provider.googleWidth();
      if (user != null) {
        Users userControl = await Cloud().getUsers(user.id);
        if (userControl == null) {
          var userNotFound = SnackBar(content: Text("User not found"));
          // ignore: deprecated_member_use
          scfKey.currentState.showSnackBar(userNotFound);
        }
      }
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => StreamAuthControl(),
          ));
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      getErrorMessage(errorCode: e.code);
    }
  }

  // ignore: missing_return
  Future<String> getErrorMessage({errorCode}) {
    String errorMesage;
    if (errorCode == "ERROR_USER_NOT_FOUND") {
      errorMesage = "Email bulunamadı";
    } else if (errorCode == "ERROR_WRONG_PASSWORD") {
      errorMesage = "Geçersiz şifre";
    } else if (errorCode == "ERROR_USER_DİSABLED") {
      errorMesage = "Kunlanici Engellenmiştir";
    } else if (errorCode == "ERROR_INVALID_EMAIL") {
      errorMesage = "Eposta Adresi geçersizdir";
    } else {
      errorMesage = " Tanınmayan bir hata oluştu$errorCode";
    }
    var snackbar = SnackBar(content: Text(errorMesage));
    // ignore: deprecated_member_use
    scfKey.currentState.showSnackBar(snackbar);
  }
}
