
import 'package:store/models/shoes/company.dart';
import 'package:store/models/shoes/Catgory.dart';
import 'package:store/models/shoes/shoes.dart';
import 'package:store/models/shoes/view.dart';

class Product {
  Shoes shoes;
  Company company;
  Category category;
  DateTime addedDate;
  bool isNew;
  Views views;
  

  Product({
    this.category,
    this.views,
    this.isNew,
    this.addedDate,
    this.company,
    this.shoes,
  });
}
