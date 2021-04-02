//import 'package:store/models/shoes/kind.dart';

import 'package:store/models/shoes/shoesColor.dart';

class Shoes {
  int id;
  String shoesImg;
  int size;
  String name;
  bool isWowan;
  bool isChild;
  bool isMan;
  ShoesColor shoesColor;
  int price;

  Shoes({
    this.id,
    this.shoesColor,
    this.name,
    this.price,
    this.shoesImg,
    this.size,
    this.isMan,
    this.isChild,
    this.isWowan,
  });
}


