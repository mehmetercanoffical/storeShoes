import 'package:store/models/shoes/company.dart';
import 'package:store/models/shoes/kind.dart';
import 'package:store/models/shoes/shoes.dart';
import 'package:store/models/shoes/shoesColor.dart';
import 'package:store/models/shoes/view.dart';
import 'package:store/models/products.dart';
import 'package:store/style/sizeconfig.dart';

List<Product> products = [
  new Product(
    addedDate: DateTime.now(),
    shoes: Shoes(
      id: 2,
      size: 38,
      isWowan: true,
      isChild: false,
      isMan: true,
      shoesColor: ShoesColor(id: 2, name: "black"),
      price: 100,
      shoesImg: "$imgPath/page.png",
      name: "Nike SB Janoski QS Turbo Green Tie Dye Skate Shoes",
    ),
    isNew: false,
    company: Company(
      id: 1,
      logoImg: "$imgPath/nike.png",
      name: "Adidas",
      shoes: Shoes(),
    ),
    kind: Kind(id: 20, imgUrl: "", name: "Sports"),
    views: Views(like: 100, views: 1500),
  ),
  new Product(
    addedDate: DateTime.now(),
    views: Views(like: 10000, views: 6500),
    company: Company(id: 1, logoImg: "$imgPath/nike.png", name: "Nike"),
    kind: Kind(id: 20, imgUrl: "", name: "Sports"),
    isNew: false,
    shoes: Shoes(
      size: 38,
      id: 2,
      isWowan: false,
      isChild: true,
      isMan: false,
      price: 100,
      shoesImg: "$imgPath/page2.png",
      name: "Nike SB Janoski QS Turbo Green Tie Dye Skate Shoes",
    ),
  ),
  new Product(
    addedDate: DateTime.now(),
    isNew: false,
    company: Company(id: 1, logoImg: "$imgPath/nike.png", name: "Adidas"),
    views: Views(like: 2000, views: 2800),
    kind: Kind(id: 20, imgUrl: "", name: "Çocuk"),
    shoes: Shoes(
      id: 2,
      shoesColor: ShoesColor(id: 2, name: "black"),
      size: 33,
      isWowan: true,
      isChild: false,
      isMan: false,
      price: 100,
      shoesImg: "$imgPath/page3.png",
      name: "Nike SB Janoski QS Turbo Green Tie Dye Skate Shoes",
    ),
  ),
  new Product(
    addedDate: DateTime.now(),
    company: Company(id: 1, logoImg: "$imgPath/nike.png", name: "Nike"),
    views: Views(like: 2000, views: 2800),
    kind: Kind(id: 20, imgUrl: "", name: "Topuklu Ayakkabı"),
    isNew: false,
    shoes: Shoes(
      id: 2,
      price: 100,
      size: 28,
      shoesColor: ShoesColor(id: 2, name: "black"),
      isWowan: true,
      isChild: false,
      isMan: false,
      shoesImg: "$imgPath/page2.png",
      name: "Nike SB Janoski QS Turbo Green Tie Dye Skate Shoes",
    ),
  ),
];
