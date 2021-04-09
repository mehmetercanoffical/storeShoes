import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/models/products.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';

// ignore: must_be_immutable
class GridCompanenet extends StatelessWidget {
  Product stories;

  GridCompanenet({
    this.stories,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: trasparentColor,
      highlightColor: trasparentColor,
      // onTap: () {
      //   Navigator.push(
      //       context,
      //       CupertinoPageRoute(
      //         builder: (context) => ProductDetail(
      //           doc: ,
      //         ),
      //       ));
      // },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kPaddingHorizontal,
          vertical: kPaddingVertical,
        ),
        child: Container(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    stories.company.logoImg,
                  ),
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    height: 80,
                    alignment: Alignment.center,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.fitHeight,
                        image: AssetImage(stories.shoes.shoesImg),
                      ),
                      borderRadius: BorderRadius.circular(12),
                      // color: greyColor,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stories.shoes.name,
                    style: popiens(
                      context,
                      15,
                      darkColor,
                      FontWeight.w600,
                    ),
                  ),
                  sheight5,
                  Text(
                    stories.category.name,
                    style: popiens(
                      context,
                      15,
                      greyColor,
                      FontWeight.w300,
                    ),
                  ),
                  Text(
                    "TR " + stories.shoes.price.toString(),
                    style: popiens(
                      context,
                      15,
                      darkColor,
                      FontWeight.w600,
                    ),
                  ),
                  sheight5,
                ],
              ),
              swidth10,
            ],
          ),
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
