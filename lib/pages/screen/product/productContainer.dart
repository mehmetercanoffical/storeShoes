import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/models/products.dart';
import 'package:store/pages/screen/product/productDetail.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/color.dart';
import 'package:store/style/textStyle.dart';

// ignore: must_be_immutable
class ProductContainer extends StatelessWidget {
  Product stories;

  ProductContainer({
    this.stories,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ProductDetail(
                stories: stories,
              ),
            ));
      },
      child: Container(
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
                  Image.asset(stories.company.logoImg, fit: BoxFit.cover),
                  sheight5,
                  Image.asset(stories.shoes.shoesImg, fit: BoxFit.cover),
                ],
              ),
            ),
            sheight5,
            Text(
              stories.shoes.name,
              style: buildPopiens(context),
            ),
            sheight10,
            Text(
              stories.shoes.price.toString(),
              style: buildPopiens(context),
            ),
            sheight5,
          ],
        ),
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
