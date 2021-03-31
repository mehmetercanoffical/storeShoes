import 'package:flutter/material.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';

List<NewPopular> popularPageView = [
  new NewPopular(
    imgPath: "$imgPath/page.png",
    isNew: true,
    price: 100,
    title: "Nike SB Janoski QS Turbo Green Tie Dye Skate Shoes",
  ),
  new NewPopular(
    imgPath: "$imgPath/page2.png",
    isNew: true,
    price: 100,
    title: "Nike SB Janoski QS Turbo Green Tie Dye Skate Shoes",
  ),
  new NewPopular(
    imgPath: "$imgPath/page3.png",
    isNew: false,
    price: 100,
    title: "Nike SB Janoski QS Turbo Green Tie Dye Skate Shoes",
  ),
];

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
                      children: [
                        Container(
                          height: 345,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                popularPageView[index].imgPath,
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
                                        style: popiens(context, 18, whiteColor,
                                            FontWeight.w300),
                                      )
                                    : Text(""),
                                sheight10,
                                Text(
                                  popularPageView[index].title,
                                  style: popiens(
                                      context, 24, whiteColor, FontWeight.w600),
                                ),
                                sheight10,
                                Text(
                                  popularPageView[index].price.toString(),
                                  style: popiens(
                                      context, 18, whiteColor, FontWeight.w500),
                                ),
                                sheight20,
                                Row(
                                  children: [
                                    for (int i = 0;
                                        i < popularPageView.length;
                                        i++)
                                      i == currentPage
                                          ? animatedContainer(true)
                                          : animatedContainer(false)
                                  ],
                                ),
                                sheight20,
                              ],
                            ),
                          ),
                        )
                      ],
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
              Container(
                width: double.infinity,
                height: 260,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: getshoesHorizontal.length,
                    itemBuilder: (context, index) {
                      return ShoesHorizontal(
                        imgPath: getshoesHorizontal[index].imgPath,
                        kind: getshoesHorizontal[index].kind,
                        logoPath: getshoesHorizontal[index].logoPath,
                        price: getshoesHorizontal[index].price,
                        title: getshoesHorizontal[index].title,
                      );
                    }),
              ),
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
              Container(
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
                          imgPath: getshoesHorizontal[index].imgPath,
                          kind: getshoesHorizontal[index].kind,
                          logoPath: getshoesHorizontal[index].logoPath,
                          price: getshoesHorizontal[index].price,
                          title: getshoesHorizontal[index].title,
                        );
                      })),
              sheight30,
            ],
          ),
        ),
      ),
    );
  }

  Widget animatedContainer(bool isSelected) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 800,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1),
        height: isSelected ? 5 : 5,
        width: isSelected ? 50 : 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
          color: isSelected ? whiteColor : whiteColor.withOpacity(0.6),
        ),
      ),
    );
  }
}

List<ShoesHorizontal> getshoesHorizontal = [
  new ShoesHorizontal(
    imgPath: "$imgPath/shoes1.png",
    kind: "Lovelly Kind",
    logoPath: "$imgPath/nike.png",
    price: 100,
    title: 'Nike ISPA Overreact Sail Multi',
  ),
  new ShoesHorizontal(
    imgPath: "$imgPath/shoes2.png",
    kind: "Lovelly Kind",
    logoPath: "$imgPath/addidas.png",
    price: 100,
    title: 'Nike ISPA Overreact Sail Multi',
  ),
  new ShoesHorizontal(
    imgPath: "$imgPath/shoes1.png",
    kind: "Lovelly Kind",
    logoPath: "$imgPath/nike.png",
    price: 100,
    title: 'Nike ISPA Overreact Sail Multi',
  ),
  new ShoesHorizontal(
    imgPath: "$imgPath/shoes2.png",
    kind: "Lovelly Kind",
    logoPath: "$imgPath/addidas.png",
    price: 100,
    title: 'Nike ISPA Overreact Sail Multi',
  ),
  new ShoesHorizontal(
    imgPath: "$imgPath/shoes1.png",
    kind: "Lovelly Kind",
    logoPath: "$imgPath/nike.png",
    price: 100,
    title: 'Nike ISPA Overreact Sail Multi',
  ),
  new ShoesHorizontal(
    imgPath: "$imgPath/shoes2.png",
    kind: "Lovelly Kind",
    logoPath: "$imgPath/addidas.png",
    price: 100,
    title: 'Nike ISPA Overreact Sail Multi',
  ),
];

class ShoesHorizontal extends StatelessWidget {
  String logoPath;
  String imgPath;
  String title;
  int price;
  String kind;

  ShoesHorizontal(
      {this.imgPath, this.kind, this.logoPath, this.price, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                Image.asset(logoPath, fit: BoxFit.cover),
                sheight5,
                Image.asset(imgPath, fit: BoxFit.cover),
              ],
            ),
          ),
          sheight5,
          Text(
            title,
            style: popiens(context, 14, darkColor, FontWeight.w800),
          ),
          sheight5,
          Text(
            kind,
            style: popiens(context, 14, greyColor, FontWeight.w200),
          ),
          sheight10,
          Text(
            price.toString(),
            style: popiens(context, 14, darkColor, FontWeight.w800),
          ),
          sheight5,
        ],
      ),
    );
  }
}
