//import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:store/models/shoes/company.dart';
import 'package:store/models/shoes/kind.dart';
import 'package:store/models/shoes/shoes.dart';
import 'package:store/models/shoes/view.dart';
import 'package:store/style/sizeconfig.dart';

class Stories {
  Shoes shoesModels;
  Company company;
  Kind kind;
  
  bool isNew;
  Views views;

  Stories({
    this.kind,
    this.views,
    this.isNew,
    this.company,
    this.shoesModels,
  });
}

List<Stories> popularPageView = [
  new Stories(
    shoesModels: Shoes(
      id: 2,
      size: 38,
      isWowan: false,
      price: 100,
      shoesImg: "$imgPath/page.png",
      name: "Nike SB Janoski QS Turbo Green Tie Dye Skate Shoes",
    ),
    isNew: false,
    company: Company(id: 1, logoImg: "$imgPath/nike.png", name: "Adidas"),
    kind: Kind(id: 20, imgUrl: "", name: "Sports"),
    views: Views(like: 100, views: 1500),
  ),
  new Stories(
    views: Views(like: 10000, views: 6500),
    company: Company(id: 1, logoImg: "$imgPath/nike.png", name: "Nike"),
    kind: Kind(id: 20, imgUrl: "", name: "Sports"),
    isNew: false,
    shoesModels: Shoes(
      size: 38,
      isWowan: false,
      id: 2,
      price: 100,
      shoesImg: "$imgPath/page2.png",
      name: "Nike SB Janoski QS Turbo Green Tie Dye Skate Shoes",
    ),
  ),
  new Stories(
    isNew: false,
    company: Company(id: 1, logoImg: "$imgPath/nike.png", name: "Adidas"),
    views: Views(like: 2000, views: 2800),
    shoesModels: Shoes(
      id: 2,
      size: 33,
      isWowan: true,
      price: 100,
      shoesImg: "$imgPath/page3.png",
      name: "Nike SB Janoski QS Turbo Green Tie Dye Skate Shoes",
    ),
  ),
  new Stories(
    company: Company(id: 1, logoImg: "$imgPath/nike.png", name: "Nike"),
    views: Views(like: 2000, views: 2800),
    kind: Kind(id: 20, imgUrl: "", name: "Çocuk"),
    isNew: false,
    shoesModels: Shoes(
      id: 2,
      price: 100,
      size: 28,
      isWowan: false,
      shoesImg: "$imgPath/page2.png",
      name: "Nike SB Janoski QS Turbo Green Tie Dye Skate Shoes",
    ),
  ),
];


