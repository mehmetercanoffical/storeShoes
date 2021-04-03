import 'package:flutter/material.dart';
import 'package:store/models/products.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';

// ignore: must_be_immutable
class CompanyList extends StatelessWidget {
  Product company;

  CompanyList({
    this.company,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: trasparentColor,
      splashColor: trasparentColor,
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: 100,
        width: 80,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 60,
              decoration: BoxDecoration(
                color: Color(0xff12121D).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                company.company.logoImg,
              ),
            ),
            sheight15,
            Text(
              company.company.name,
              style: popiens(
                context,
                15,
                darkColor,
                FontWeight.w600,
              ),
            ),
            Text(
              "All " + company.company.allProducts.toString(),
              style: popiens(
                context,
                15,
                greyColor,
                FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
