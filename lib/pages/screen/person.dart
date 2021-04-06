import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/users.dart';
import 'package:store/services/authacation.dart';
import 'package:store/services/cloud.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';
import 'package:store/widget/prsnDataNtfcation.dart';
import 'package:store/widget/userWidget.dart';

class Person extends StatefulWidget {
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  var id;
  @override
  void initState() {
    id = Provider.of<Authacation>(context, listen: false).activeUserId;
    controller = ScrollController();
    super.initState();
  }

  Users user;
  Cloud cloud = new Cloud();
  ScrollController controller;
  bool isScrollChage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: kPaddingVertical,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  myandsettings(
                    context,
                    press: () {},
                  ),
                  sheight20,
                  FutureBuilder<Object>(
                    future: cloud.getUsers(id),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }
                      user = snapshot.data;

                      return UserWdiget(user: user);
                    },
                  ),
                  sheight30,
                  titleText(title: "Buying"),
                  FutureBuilder(
                    future: cloud.getPersonBuyInFormation(id),
                    builder: (context, snapshot) {
                      return !snapshot.hasData
                          ? CircularProgressIndicator()
                          : Container(
                              height: 100,
                              width: double.infinity,
                              child: ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  // ignore: unnecessary_statements
                                  DocumentSnapshot doc =
                                      snapshot.data.documents[index];
                                  return PersonBuyAndSellContaier(
                                    title: doc["title"],
                                    caucht: doc["isBuy"],
                                    color: Color(0xff42D70D).withOpacity(0.6),
                                    textColor: Color(0xff42D70D),
                                  );
                                },
                              ),
                            );
                    },
                  ),
                  sheight10,
                  getpersonAboutAndNtfcationList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container titleText({String title}) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: popiens(
          context,
          17,
          darkColor,
          FontWeight.w900,
        ),
      ),
    );
  }

  StreamBuilder<QuerySnapshot> getpersonAboutAndNtfcationList() {
    return StreamBuilder(
      stream: cloud.getPersonAboutAndNotification(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? CircularProgressIndicator()
            : Container(
                height: 500,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    // ignore: unnecessary_statements
                    DocumentSnapshot doc = snapshot.data.documents[index];
                    return PersonPageAltSettings(
                      title: doc["title"],
                      notification: doc["notification"],
                    );
                  },
                ),
              );
      },
    );
  }

  Row myandsettings(BuildContext context, {Function press}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "My",
          style: popiens(
            context,
            28,
            darkColor,
            FontWeight.bold,
          ),
        ),
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: greyColor.withOpacity(0.4),
          ),
          child: IconButton(
            icon: Icon(Icons.settings),
            onPressed: press,
          ),
        )
      ],
    );
  }
}

class PersonBuyAndSellContaier extends StatelessWidget {
  String title;
  int caucht;
  Color color;
  Color textColor;

  PersonBuyAndSellContaier(
      {this.caucht, this.title, this.color, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          gettitleandCauch(
            title: title,
            caucht: caucht,
            context: context,
          ),
          swidth10,
          gettitleandCauch(
            title: title,
            caucht: caucht,
            context: context,
          ),
          swidth10,
          gettitleandCauch(
            title: title,
            caucht: caucht,
            context: context,
          ),
        ],
      ),
    );
  }

  Column gettitleandCauch({String title, int caucht, BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: popiens(
              context,
              13,
              darkColor,
              FontWeight.w300,
            )),
        sheight10,
        Text(caucht.toString(),
            style: popiens(
              context,
              13,
              textColor,
              FontWeight.w300,
            )),
      ],
    );
  }
}
