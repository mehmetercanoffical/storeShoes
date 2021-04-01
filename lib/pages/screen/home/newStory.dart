import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/models/stories.dart';
import 'package:store/pages/screen/home/shoesHori.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';
import 'package:store/widget/animated.dart';

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
  PageController controller;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

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
                  itemCount: popularPageView.length,
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
              sheight30,
              listHorizontal(),
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
              sheight30,
              gridHorizontal(),
              sheight30,
            ],
          ),
        ),
      ),
    );
  }

  Container gridHorizontal() {
    return Container(
        width: double.infinity,
        height: 600,
        child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: getshoesHorizontal.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
            itemBuilder: (context, index) {
              return ShoesHorizontal(
                stories: getshoesHorizontal[index].stories,
              );
            }));
  }

  Container listHorizontal() {
    return Container(
      width: double.infinity,
      height: 260,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: getshoesHorizontal.length,
          itemBuilder: (context, index) {
            return ShoesHorizontal(
              stories: getshoesHorizontal[index].stories,
            );
          }),
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
            popularPageView[index].shoesModels.shoesImg,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            popularPageView[index].isNew
                ? Text(
                    "New in",
                    style: popiens(context, 18, whiteColor, FontWeight.w300),
                  )
                : Text(""),
            sheight10,
            Text(
              popularPageView[index].shoesModels.name,
              style: popiens(context, 24, whiteColor, FontWeight.w600),
            ),
            sheight10,
            Text(
              popularPageView[index].shoesModels.price.toString(),
              style: popiens(context, 18, whiteColor, FontWeight.w500),
            ),
            sheight20,
            Row(
              children: [
                for (int i = 0; i < popularPageView.length; i++)
                  i == currentPage
                      ? AnimatedContan(isSelected: true)
                      : AnimatedContan(isSelected: false)
              ],
            ),
            sheight20,
          ],
        ),
      ),
    );
  }
}
