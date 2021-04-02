import 'package:flutter/material.dart';
import 'package:store/models/products.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';
import 'package:store/widget/iconCenter.dart';
import 'package:store/widget/shorInformation.dart';

// ignore: must_be_immutable
class ProductDetail extends StatefulWidget {
  Product stories;
  ProductDetail({this.stories});
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
                Container(
                  height: 180,
                  width: 300,
                  child: Image.asset(
                    widget.stories.shoes.shoesImg,
                  ),
                ),
                // Size size  //
                // Button Buy //
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.stories.shoes.name,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    information(
                        title: "Style", descp: widget.stories.kind.name),
                    information(
                        title: "Color",
                        descp: widget.stories.shoes.shoesColor.name),
                    information(
                        title: "Price",
                        descp: widget.stories.shoes.price.toString()),
                    information(
                        title: "Date",
                        descp: widget.stories.addedDate.toString()),
                  ],
                ),
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
        ShortInformation(
          title: "Condination",
          isNew: widget.stories.isNew,
        ),
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
        ShortInformation(
          title: "quality",
          datetime: widget.stories.addedDate,
        ),
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
