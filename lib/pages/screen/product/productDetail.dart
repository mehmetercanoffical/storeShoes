import 'package:flutter/material.dart';
import 'package:store/models/stories.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';
import 'package:store/widget/iconCenter.dart';

class ProductDetail extends StatefulWidget {
  Stories stories;
  ProductDetail({this.stories});
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kPaddingHorizontal,
            vertical: kPaddingVertical,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              topMenu(context),
              Container(
                height: 180,
                width: 300,
                child: Image.asset(
                  widget.stories.shoesModels.shoesImg,
                ),
              ),
              // Size size  //
              // Button Buy //
              Container(
                alignment: Alignment.centerLeft,
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.stories.shoesModels.name,
                  style: roboto(context, 25, darkColor, FontWeight.w600),
                ),
              ),
              sheight10,
              Row(
                children: [
                  ShortInformation(
                    title: "Condination",
                    descp: widget.stories.isNew.toString(),
                  ),
                  ShortInformation(
                    title: "quality",
                    descp: widget.stories.isNew.toString(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
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
}

class ShortInformation extends StatelessWidget {
  final String title;
  final String descp;

  const ShortInformation({Key key, this.title, this.descp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            title + ": ",
            style: popiens(
              context,
              16,
              darkColor.withOpacity(0.8),
              FontWeight.w400,
            ),
          ),
          Text(
            descp,
            style: popiens(
              context,
              16,
              greenColor,
              FontWeight.w600,
            ),
          ),
          swidth10,
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
        ],
      ),
    );
  }
}
