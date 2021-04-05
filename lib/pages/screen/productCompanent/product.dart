import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';

class productList extends StatelessWidget {
  const productList({
    Key key,
    @required this.doc,
  }) : super(key: key);

  final DocumentSnapshot doc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
      width: 150,
      height: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                //Image.network(doc["shoesImg"], fit: BoxFit.cover),
                sheight5,
                Hero(
                  tag: "tag",
                  child: Image.network(
                    doc["shoesImg"],
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          sheight5,
          Text(
            doc["name"],
            style: buildPopiens(context),
          ),
          sheight10,
          Row(
            children: [
              Text(
                doc["price"].toString(),
                style: buildPopiens(context),
              ),
              swidth10,
              Text(
                doc["categoryId"],
                style: buildPopiens(context),
              )
            ],
          ),
          sheight5,
        ],
      ),
    );
  }

  TextStyle buildPopiens(BuildContext context) => popiens(
        context,
        14,
        darkColor,
        FontWeight.w800,
      );
}