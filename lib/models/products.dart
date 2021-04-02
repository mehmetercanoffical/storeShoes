//import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:store/models/shoes/company.dart';
import 'package:store/models/shoes/kind.dart';
import 'package:store/models/shoes/shoes.dart';
import 'package:store/models/shoes/view.dart';

class Product {
  Shoes shoes;
  Company company;
  Kind kind;
  DateTime addedDate;
  bool isNew;
  Views views;

  Product({
    this.kind,
    this.views,
    this.isNew,
    this.addedDate,
    this.company,
    this.shoes,
  });
}
