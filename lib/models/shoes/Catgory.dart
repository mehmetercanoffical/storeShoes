import 'package:store/models/shoes/shoes.dart';

class Category {
  dynamic id;
  String name;
  String imgUrl;
  Shoes shoes;

  Category({
    this.shoes,
    this.id,
    this.imgUrl,
    this.name,
  });
}
