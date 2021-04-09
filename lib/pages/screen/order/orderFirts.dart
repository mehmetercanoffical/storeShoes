import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/pages/screen/order/paymant.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';
import 'package:store/widget/buttonNext.dart';
import 'package:store/widget/title.dart';

class Order extends StatefulWidget {
  const Order({this.doc});
  final DocumentSnapshot doc;
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int currentPage = 0;
  bool isShow = true;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleCenter2(
                  text: "Payment",
                ),
                sheight5,
                Row(
                  children: [
                    sheight10,
                    Image.network(
                      widget.doc["shoesImg"],
                      fit: BoxFit.cover,
                    ),
                    swidth10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //  Image.network(widget.doc[""])
                        //
                        buildText(
                          context,
                          text: widget.doc["name"],
                          color: darkColor,
                        ),
                        buildText(
                          context,
                          text: widget.doc["categoryName"],
                          color: greyColor,
                        ),
                        buildText(
                          context,
                          text: "Tr " + widget.doc["price"].toString(),
                          color: darkColor,
                        ),
                      ],
                    )
                  ],
                ),
                sheight30,
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(52),
                  ),
                  child: Row(
                    children: [
                      AnimaedContainerSelect(
                        color: isShow ? greenColor : greyColor,
                        press: () {
                          setState(() {
                            isShow = true;
                          });
                        },
                        text: "Price Bid",
                      ),
                      AnimaedContainerSelect(
                        color: isShow ? greyColor : greenColor,
                        press: () {
                          setState(() {
                            isShow = false;
                          });
                        },
                        text: "Buy Now",
                      ),
                    ],
                  ),
                ),
                sheight10,
                isShow
                    ? priceBidMethod(context)
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: Container(
                            color: Colors.blue,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded priceBidMethod(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText(
                context,
                text: "Price: " + widget.doc["price"].toString() + " TR",
                color: darkColor,
              ),
              sheight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildText(
                    context,
                    text: "Discount",
                    color: darkColor,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 130,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: greyColor.withOpacity(0.4),
                    ),
                    child: Text(
                      "+ Add Discount",
                      style: roboto(
                        context,
                        16,
                        darkColor,
                        FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              sheight20,
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    buildRow(
                      context,
                      text: "Total (TR): ",
                      total: widget.doc["price"],
                    ),
                    sheight10,
                    buildRow(
                      context,
                      text: "Total (TR): ",
                      total: widget.doc["price"],
                    ),
                    sheight10,
                    buildRow(
                      context,
                      text: "Total (TR): ",
                      total: widget.doc["price"],
                    ),
                  ],
                ),
              ),
              sheight10,
              Align(
                alignment: Alignment.center,
                child: ButtonNext(
                  press: () {
                    Get.to(
                      () => Paymend(),
                      transition: Transition.leftToRight,
                    );
                  },
                  title: "Next",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text buildText(BuildContext context, {String text, Color color}) {
    return Text(
      text,
      style: popiens(
        context,
        18,
        color,
        FontWeight.w600,
      ),
    );
  }

  Row buildRow(BuildContext context, {String text, int total}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: roboto(
            context,
            18,
            darkColor,
            FontWeight.w600,
          ),
        ),
        Text(
          total.toString(),
          style: roboto(
            context,
            18,
            darkColor,
            FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class AnimaedContainerSelect extends StatelessWidget {
  AnimaedContainerSelect({
    this.color,
    this.press,
    this.text,
  });
  Color color;
  String text;
  Function press;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: press,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(52),
          ),
          child: Text(
            text,
            style: popiens(
              context,
              17,
              whiteColor,
              FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
