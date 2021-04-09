import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/pages/screen/order/orderFirts.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';
import 'package:store/widget/iconCenter.dart';

// ignore: must_be_immutable
class ProductDetail extends StatefulWidget {
  const ProductDetail({
    Key key,
    @required this.doc,
  }) : super(key: key);

  final DocumentSnapshot doc;
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
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
                topMenu(context),
                Hero(
                  tag: "tag",
                  child: Container(
                    height: 180,
                    width: 300,
                    child: Image.network(widget.doc["shoesImg"]),
                  ),
                ),
                // Size size  //
                sheight20,

                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.doc["name"],
                    style: roboto(
                      context,
                      25,
                      darkColor,
                      FontWeight.w600,
                    ),
                  ),
                ),
                sheight10,
                shortInformation(),
                sheight10,
                Text(
                  "Information",
                  style: roboto(
                    context,
                    20,
                    darkColor,
                    FontWeight.w700,
                  ),
                ),
                sheight10,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      information(
                          title: "Style", descp: widget.doc["categoryName"]),
                      sheight15,
                      information(title: "Color", descp: widget.doc["color"]),
                      sheight15,
                      information(
                          title: "Price",
                          descp: widget.doc["price"].toString()),
                      sheight15,
                      // information(
                      //   title: "Date",
                      //   descp: widget.doc["categoryName"].toString(),
                      // ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Get.to(
                        () => Order(
                          doc: widget.doc,
                        ),
                        transition: Transition.cupertino,
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: greenColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Buy",
                            style: roboto(
                                context, 16, whiteColor, FontWeight.w700),
                          ),
                          swidth10,
                          Text(
                            widget.doc["price"].toString() + " TR",
                            style: popiens(
                                context, 16, whiteColor, FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                sheight20,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row information({String title, String descp}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: roboto(
          context,
          18,
          greyColor,
          FontWeight.w300,
        ),
      ),
      Text(
        descp,
        textAlign: TextAlign.justify,
        style: roboto(
          context,
          18,
          darkColor,
          FontWeight.w300,
        ),
      )
    ]);
  }

  Row shortInformation() {
    return Row(
      children: [
        // shrt information bir küçük bir widgettir. widget kısmından bulunur.
        // ShortInformation(
        //   title: "Condination",
        //   isNew: widget.stories.isNew,
        // ),
        Container(
          alignment: Alignment.center,
          height: 5,
          width: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: darkColor,
          ),
          child: Text("."),
        ),
        swidth10,
        // ShortInformation(
        //   title: "quality",
        //   datetime: widget.stories.addedDate,
        // ),
      ],
    );
  }

  Row topMenu(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconCenter(
          iconData: Icons.arrow_back,
          color: greyColor.withOpacity(0.4),
          press: () => Navigator.pop(context),
        ),
        Spacer(),
        Row(
          children: [
            IconCenter(
              iconData: Icons.add,
              color: whiteColor,
              press: () {},
            ),
            swidth10,
            IconCenter(
              iconData: Icons.menu,
              color: whiteColor,
              press: () {},
            ),
          ],
        ),
        sheight10,
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
