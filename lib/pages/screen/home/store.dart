import 'package:flutter/material.dart';
import 'package:store/models/products/popularTopView.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';

class Story extends StatefulWidget {
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  int currentPage = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Container(
                    height: 345,
                    margin: EdgeInsets.symmetric(vertical: 15),
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
                            // popularPageView[index].isNew
                            //     ? Text(
                            //         "New in",
                            //         style: popiens(context, 18, whiteColor,
                            //             FontWeight.w300),
                            //       )
                            //     : Text(""),
                            sheight10,
                            Text(
                              products[index].shoes.name,
                              style: popiens(
                                  context, 24, whiteColor, FontWeight.w600),
                            ),
                            sheight10,
                            Row(
                              children: [
                                Image.asset(
                                    products[index].company.logoImg,
                                    fit: BoxFit.cover),
                                Text(
                                  products[index].company.name,
                                  style: popiens(
                                      context, 18, whiteColor, FontWeight.w500),
                                ),
                                swidth10,
                                Text(
                                  "views: " +
                                      products[index]
                                          .views
                                          .like
                                          .toString(),
                                  style: popiens(
                                      context, 18, whiteColor, FontWeight.w500),
                                ),
                              ],
                            ),
                            sheight20,
                          ],
                        )));
              }),
        ),
      ),
    );
  }
}
