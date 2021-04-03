//import 'package:store/models/shoes/kind.dart';

import 'package:flutter/cupertino.dart';
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
  double price;
  int companyId;

  Shoes({
    @required this.id,
    this.shoesColor,
    this.name,
    this.companyId,
    this.price,
    this.shoesImg,
    this.size,
    this.isMan,
    this.isChild,
    this.isWowan,
  });
}
