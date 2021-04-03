import 'package:store/models/shoes/company.dart';
import 'package:store/models/shoes/Catgory.dart';
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
      isMan: false,
      shoesColor: ShoesColor(id: 2, name: "Red"),
      price: 100,
      shoesImg: "$imgPath/page3.png",
      name: "Addidas Tie Dye Skate Shoes",
    ),
    isNew: false,
    company: Company(
      id: 11,
      logoImg: "$imgPath/vans.png",
      name: "Balance",
      allProducts: 9000,
      addressDate: "Ankara",
      descp: "En iyi Balance ayakkabıları burada",
      phoneNuber: 11111555555,
    ),
    category: Category(id: 20, imgUrl: "", name: "Sports"),
    views: Views(like: 100, views: 1500),
  ),
  new Product(
    addedDate: DateTime.now(),
    shoes: Shoes(
      id: 2,
      size: 40,
      isWowan: true,
      isChild: false,
      isMan: false,
      shoesColor: ShoesColor(id: 2, name: "Blue"),
      price: 250,
      shoesImg: "$imgPath/page2.png",
      name: "Ninty Bblue shoes2",
    ),
    isNew: false,
    views: Views(like: 100, views: 1500),
    company: Company(
      id: 1,
      logoImg: "$imgPath/nike.png",
      allProducts: 5600,
      name: "Nike",
      addressDate: "İstanbul/Umraniye",
      descp: "En iyi Nike ayakkabıları burada",
      phoneNuber: 11111555555,
    ),
  ),
];
