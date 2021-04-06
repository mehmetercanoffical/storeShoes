import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store/models/products/popularTopView.dart';
import 'package:store/pages/screen/productCompanent/product.dart';
import 'package:store/services/storiesCloud.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';
import 'package:store/widget/animated.dart';

// ignore: must_be_immutable
class NewPopular extends StatefulWidget {
  String imgPath;
  String title;
  bool isNew;
  double price;

  NewPopular({
    this.imgPath,
    this.isNew,
    this.price,
    this.title,
  });

  @override
  _NewPopularState createState() => _NewPopularState();
}

class _NewPopularState extends State<NewPopular> {
  int currentPage = 0;

  StoriesCloud cloud = StoriesCloud();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 345,
                width: double.infinity,
                child: PageView.builder(
                  onPageChanged: (int page) {
                    currentPage = page;
                    setState(() {});
                  },
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [pageviewTop(index, context)],
                    );
                  },
                ),
              ),
              sheight30,
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Just Dropped",
                  style: popiens(
                    context,
                    17,
                    darkColor,
                    FontWeight.w700,
                  ),
                ),
              ),
              sheight15,
              StreamBuilder(
                stream: cloud.getShoes(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? CircularProgressIndicator()
                      : Container(
                          width: double.infinity,
                          height: 260,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            primary: false,
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot doc =
                                  snapshot.data.documents[index];

                              return ProductList(doc: doc);
                            },
                          ),
                        );
                },
              ),
              sheight30,
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Most Popular",
                  style: popiens(
                    context,
                    17,
                    darkColor,
                    FontWeight.w700,
                  ),
                ),
              ),
              sheight15,
              //gridHorizontal(),
              sheight15,
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular Brands",
                  style: popiens(
                    context,
                    17,
                    darkColor,
                    FontWeight.w700,
                  ),
                ),
              ),
              sheight15,
              //listCompany(),
            ],
          ),
        ),
      ),
    );
  }

  Container pageviewTop(int index, BuildContext context) {
    return Container(
      height: 345,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            products[index].shoes.shoesImg,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            sheight10,
            Text(
              products[index].shoes.name,
              style: popiens(context, 24, whiteColor, FontWeight.w600),
            ),
            sheight10,
            Text(
              "TR" + " " + products[index].shoes.price.toString(),
              style: popiens(context, 18, whiteColor, FontWeight.w500),
            ),
            sheight20,
            Row(
              children: [
                for (int i = 0; i < products.length; i++)
                  i == currentPage
                      ? AnimatedContaniner(isSelected: true)
                      : AnimatedContaniner(isSelected: false)
              ],
            ),
            sheight20,
          ],
        ),
      ),
    );
  }
}
