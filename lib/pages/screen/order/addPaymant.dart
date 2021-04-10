import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/models/cardModel.dart';
import 'package:store/services/getxController.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';
import 'package:store/widget/buttonNext.dart';
import 'package:store/widget/title.dart';

import '../../../models/cardModel.dart';
import 'paymant.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String securitCode, cardNumber;
  String name, cardDate;
  bool isLoading = false;
  List<CardModel> cardModel = new List<CardModel>();

  final GetCardController getCardController = Get.put(GetCardController());
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kPaddingHorizontal,
              vertical: kPaddingVertical,
            ),
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Form(
                      key: key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleCenter2(
                            text: "Add to Card",
                          ),
                          sheight15,
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: greyColor.withOpacity(0.2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    cardNumber.toString(),
                                    style: roboto(
                                      context,
                                      18,
                                      darkColor,
                                      FontWeight.w500,
                                    ),
                                  ),
                                  sheight15,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      cardData(
                                        title: "Card Holder",
                                        descp: name.toString().toUpperCase(),
                                      ),
                                      cardData(
                                        title: "Expires",
                                        descp: cardDate.toString(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          sheight15,
                          buildTextFormField(
                            context,
                            onChanged: (text) {
                              setState(() {
                                name = text;
                              });
                            },
                            onSave: (value) {
                              setState(() {
                                name = value;
                              });
                            },
                            type: TextInputType.name,
                            validate: (value) {
                              if (value.isEmpty) {
                                return "Name is not null";
                              }
                              return null;
                            },
                            text: "Name",
                          ),
                          sheight15,
                          buildTextFormField(
                            context,
                            onSave: (value) {
                              setState(() {
                                cardNumber = value;
                              });
                            },
                            onChanged: (text) {
                              setState(() {
                                cardNumber = text;
                              });
                            },
                            type: TextInputType.number,
                            validate: (value) {
                              if (value.isEmpty) {
                                return "Card Number is not null";
                              } else if (value.trim().length != 11) {
                                return "Card number wrong";
                              }
                              return null;
                            },
                            text: "Card Number",
                          ),
                          sheight15,
                          buildTextFormField(
                            context,
                            onChanged: (text) {
                              setState(() {
                                cardDate = text;
                              });
                            },
                            onSave: (value) {
                              setState(() {
                                cardDate = value;
                              });
                            },
                            type: TextInputType.datetime,
                            validate: (value) {
                              if (value.isEmpty) {
                                return "Expirty Date is not null";
                              }
                              return null;
                            },
                            text: "Expirty Date",
                          ),
                          buildTextFormField(
                            context,
                            // onChanged: (text) {
                            //   setState(() {
                            //     securitCode = text;
                            //   });
                            // },
                            onSave: (value) {
                              setState(() {
                                securitCode = value;
                              });
                            },
                            type: TextInputType.number,
                            validate: (value) {
                              if (value.isEmpty) {
                                return "Security code is not null";
                              } else if (value.trim().length != 3) {
                                return "Security code wrong";
                              }
                              return null;
                            },
                            text: "Security Code",
                          ),
                          sheight20,
                          Align(
                            alignment: Alignment.center,
                            child: ButtonNext(
                              press: () {
                                getSavetoCard();
                              },
                              title: "Save",
                              color: blueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Column cardData({
    String title,
    String descp,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: popiens(
            context,
            16,
            greyColor,
            FontWeight.w200,
          ),
        ),
        sheight10,
        Text(
          descp,
          style: popiens(
            context,
            18,
            darkColor,
            FontWeight.w200,
          ),
        ),
      ],
    );
  }

  void getSavetoCard() {
    if (key.currentState.validate()) {
      key.currentState.save();

      getCardController.add();
      Get.snackbar("Succeful", "Add Card", backgroundColor: greenColor);
      setState(() {
        print("is Loading");
        print(getCardController.cardItem);
        isLoading = true;
      });
      try {
        print("card Add");
        cardAdd();
        Get.to(() => Paymend());
      } catch (e) {
        print(e);
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void cardAdd() {
    print("Card add run");
    return cardModel.add(
      new CardModel(
        cardCompany: "Master Card",
        cardName: name,
        cardNumber: cardNumber,
        cv2: securitCode,
        cardItem: 10,
      ),
    );
  }

  TextFormField buildTextFormField(
    BuildContext context, {
    String text,
    Function validate,
    Function onChanged,
    Function onSave,
    TextInputType type,
    TextEditingController controller,
  }) {
    return TextFormField(
      onSaved: onSave,
      controller: controller,
      onChanged: onChanged,
      validator: validate,
      keyboardType: type,
      enableInteractiveSelection: false,
      style: popiens(context, 18, darkColor, FontWeight.w500),
      cursorColor: darkColor,
      decoration: InputDecoration(
        hintText: text,
      ),
    );
  }
}
