import 'package:flutter/cupertino.dart';

class Company {
  int id;
  String name;
  String logoImg;
  // Shoes shoes;
  String addressDate;
  String descp;
  int phoneNuber;
  int allProducts;

  Company({
    @required this.id,
    this.logoImg,
    this.allProducts,
    this.name,
    this.descp,
    this.addressDate,
    this.phoneNuber,
    // this.shoes,
  });
}
