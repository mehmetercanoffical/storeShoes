import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/pages/screen/productCompanent/productDetail.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key key,
    @required this.doc,
  }) : super(key: key);

  final DocumentSnapshot doc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetail(doc: doc));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
        width: 150,
        height: 270,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        doc["categoryImg"],
                        fit: BoxFit.cover,
                      ),
                      sheight5,
                      Image.network(
                        doc["shoesImg"],
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                sheight5,
                Text(
                  doc["name"],
                  style: buildPopiens(context,
                      size: 17, color: darkColor, weight: FontWeight.w600),
                ),
                sheight10,
                Text(
                  doc["categoryName"],
                  style: buildPopiens(context,
                      size: 15, color: greyColor, weight: FontWeight.w600),
                ),
                swidth10,
                Text(
                  "TR " + doc["price"].toString(),
                  style: buildPopiens(context,
                      size: 16, color: darkColor, weight: FontWeight.bold),
                ),
                sheight5,
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle buildPopiens(BuildContext context,
          {double size, Color color, FontWeight weight}) =>
      popiens(
        context,
        size,
        color,
        weight,
      );
}
