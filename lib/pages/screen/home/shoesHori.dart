import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/models/shoes/company.dart';
import 'package:store/models/shoes/kind.dart';
import 'package:store/models/shoes/shoes.dart';
import 'package:store/models/stories.dart';
import 'package:store/pages/screen/product/productDetail.dart';
import 'package:store/style/color.dart';
import 'package:store/style/sizeconfig.dart';
import 'package:store/style/textStyle.dart';

List<ShoesHorizontal> getshoesHorizontal = [
  new ShoesHorizontal(
    stories: Stories(
      shoesModels: Shoes(
        id: 2,
        price: 100,
        shoesImg: "$imgPath/shoes1.png",
        name: 'Nike ISPA Overreact Sail Multi',
      ),
      company: Company(id: 1, logoImg: "$imgPath/nike.png", name: "Adidas"),
      kind: Kind(id: 20, imgUrl: "", name: "Sports"),
      //views: Views(like: 100, views: 1500),
    ),
  ),
  new ShoesHorizontal(
    stories: Stories(
      shoesModels: Shoes(
        id: 2,
        price: 100,
        shoesImg: "$imgPath/shoes1.png",
        name: 'Nike ISPA Overreact Sail Multi',
      ),
      company: Company(id: 1, logoImg: "$imgPath/nike.png", name: "Adidas"),
      kind: Kind(id: 20, imgUrl: "", name: "Sports"),
      //views: Views(like: 100, views: 1500),
    ),
  ),
  new ShoesHorizontal(
    stories: Stories(
      shoesModels: Shoes(
        id: 2,
        price: 100,
        shoesImg: "$imgPath/shoes1.png",
        name: 'Nike ISPA Overreact Sail Multi',
      ),
      company: Company(id: 1, logoImg: "$imgPath/nike.png", name: "Adidas"),
      kind: Kind(id: 20, imgUrl: "", name: "Sports"),
      //views: Views(like: 100, views: 1500),
    ),
  ),
  new ShoesHorizontal(
    stories: Stories(
      shoesModels: Shoes(
        id: 2,
        price: 50,
        shoesImg: "$imgPath/shoes2.png",
        name: 'Nike ISPA Overreact Sail Multi',
      ),
      company: Company(id: 1, logoImg: "$imgPath/nike.png", name: "Nike"),
      kind: Kind(id: 2, imgUrl: "", name: "Sports"),
      //views: Views(like: 100, views: 1500),
    ),
  ),
  new ShoesHorizontal(
    stories: Stories(
      shoesModels: Shoes(
        id: 2,
        price: 100,
        shoesImg: "$imgPath/shoes2.png",
        name: 'Addidas ISPA Overreact Sail Multi',
      ),
      company: Company(
        id: 2,
        logoImg: "$imgPath/addidas.png",
        name: "Addidas",
      ),
      kind: Kind(
        id: 2,
        imgUrl: "",
        name: "Sports",
      ),
      //views: Views(like: 100, views: 1500),
    ),
  ),
  new ShoesHorizontal(
    stories: Stories(
      shoesModels: Shoes(
        id: 2,
        price: 100,
        shoesImg: "$imgPath/shoes2.png",
        name: 'Addidas ISPA Overreact Sail Multi',
      ),
      company: Company(id: 2, logoImg: "$imgPath/addidas.png", name: "Addidas"),
      kind: Kind(id: 2, imgUrl: "", name: "Wowan"),
      //views: Views(like: 100, views: 1500),
    ),
  ),
];

class ShoesHorizontal extends StatelessWidget {
  // Kind kind;
  // Shoes stories;
  // Company company;
  // Views views;
  Stories stories;

  ShoesHorizontal({
    // this.kind,
    // this.stories,
    // this.views,
    // this.company,
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
                  Image.asset(stories.shoesModels.shoesImg, fit: BoxFit.cover),
                ],
              ),
            ),
            sheight5,
            Text(
              stories.shoesModels.name,
              style: buildPopiens(context),
            ),
            sheight5,
            Text(
              stories.kind.name,
              style: buildPopiens(context),
            ),
            sheight10,
            Text(
              stories.shoesModels.price.toString(),
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
