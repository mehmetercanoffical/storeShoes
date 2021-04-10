import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/models/cardModel.dart';
import 'package:store/pages/screen/order/addPaymant.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';
import 'package:store/widget/title.dart';

class Paymend extends StatefulWidget {
  @override
  _PaymendState createState() => _PaymendState();
}

class _PaymendState extends State<Paymend> {
  List<CardModel> listCardModel;

  @override
  void initState() {
    super.initState();
    listCardModel = new List<CardModel>();
    print("${listCardModel.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: listCardModel.isEmpty
              ? Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kPaddingHorizontal,
                      vertical: kPaddingVertical,
                    ),
                    child: Column(
                      children: [
                        TitleCenter2(
                          text: "Payment",
                        ),
                        sheight20,
                        addCard(context)
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: listCardModel.length,
                  itemBuilder: (context, index) {
                    print("${listCardModel.length}");
                    return Container(
                      height: 10,
                      width: 10,
                      color: Colors.red,
                    );
                  },
                ),
        ),
      ),
    );
  }

  InkWell addCard(BuildContext context, {Function press}) {
    return InkWell(
      onTap: () {
        Get.to(() => AddCard());
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: greyColor.withOpacity(0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: darkColor,
            ),
            sheight10,
            Text(
              "Add Card",
              style: roboto(
                context,
                21,
                darkColor,
                FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
