import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:store/models/users.dart';
import 'package:store/pages/auth/login.dart';
import 'package:store/services/authacation.dart';
import 'package:store/services/cloud.dart';
import 'package:store/services/stream.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';
import 'package:store/widget/socialMediaAuth.dart';
import 'package:store/widget/textField.dart';

import 'package:store/widget/buttonNext.dart';

class SingUpPage extends StatefulWidget {
  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final key = GlobalKey<FormState>();
  final scfKey = GlobalKey<ScaffoldState>();
  String name, email, password;
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
                              "Let's Get Started",
                              style: popiens(
                                  context, 25, darkColor, FontWeight.bold),
                            ),
                            sheight10,
                            Text("Sign Up width Social Media or Fill to Form"),
                            sheight20,
                            Row(
                              children: [
                                SocialMediaSign(
                                  iconData: FontAwesomeIcons.facebook,
                                  press: () {},
                                ),
                                swidth10,
                                SocialMediaSign(
                                  iconData: FontAwesomeIcons.google,
                                  press: getGoogleWidth,
                                ),
                              ],
                            ),
                            sheight20,
                            TextFieldCenter(
                              title: "Name",
                              complete: true,
                              iconData: Icons.person,
                              isObs: false,
                              onSave: (value) {
                                name = value;
                              },
                              validate: (value) {
                                if (value.isEmpty) {
                                  return "You are use add name label";
                                } else if (value.trim().length < 4) {
                                  return "You are Wrong password";
                                }
                                return null;
                              },
                              type: TextInputType.name,
                            ),
                            sheight10,
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
                            //Spacer(),
                            sheight15,
                            Align(
                              alignment: Alignment.center,
                              child: Align(
                                alignment: Alignment.center,
                                child: ButtonNext(
                                  press: getSignUp,
                                  title: "Sing Up",
                                ),
                              ),
                            ),
                            sheight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Have you Account"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ));
                                  },
                                  child: Text(
                                    "Sign In",
                                    style: popiens(
                                      context,
                                      13,
                                      blueColor,
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
  Future<Users> getSignUp() async {
    final provider = Provider.of<Authacation>(context, listen: false);

    if (key.currentState.validate()) {
      key.currentState.save();
      setState(() {
        isLoading = true;
      });
      try {
        Users user = await provider.singUp(email, password);
        print(user.id);
        if (user != null) {
          Cloud().saveUsers(
            id: user.id,
            email: email,
            userName: name,
          );
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
        getErrorMessage(errorCode: e.code.toString());
      }
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
    } else if (errorCode == "ERROR_EMAIL_ALREADY_IN_USE") {
      errorMesage = "Eposta Adresi daha önceden kullanılmıştır";
    } else {
      errorMesage = " Tanınmayan bir hata oluştu";
    }
    var snackbar = SnackBar(content: Text(errorMesage));
    // ignore: deprecated_member_use
    scfKey.currentState.showSnackBar(snackbar);
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
        Cloud().saveUsers(
          id: user.id,
          email: user.email,
          photoImg: user.photoImg,
          userName: user.userName,
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      getErrorMessage(errorCode: e);
    }
  }
}
