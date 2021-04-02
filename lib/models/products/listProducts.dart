import 'package:store/models/shoes/company.dart';
import 'package:store/models/shoes/kind.dart';
import 'package:store/models/shoes/shoes.dart';
import 'package:store/models/products.dart';
import 'package:store/pages/screen/product/productContainer.dart';
import 'package:store/style/sizeconfig.dart';

List<ProductContainer> getShoeses = [
  new ProductContainer(
    
    stories: Product(
      shoes: Shoes(
        id: 2,
        price: 100,
        shoesImg: "$imgPath/shoes1.png",
        name: 'Nike ISPA Overreact Sail Multi',
      ),
      company: Company(
        id: 1,
        logoImg: "$imgPath/nike.png",
        name: "Adidas",
        shoes:  Shoes(
        id: 2,
        price: 100,
        shoesImg: "$imgPath/shoes1.png",
        name: 'Nike ISPA Overreact Sail Multi',
      ),
      ),
      kind: Kind(id: 20, imgUrl: "", name: "Sports"),
      //views: Views(like: 100, views: 1500),
    ),
  ),
  new ProductContainer(
    stories: Product(
      shoes: Shoes(
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
  new ProductContainer(
    stories: Product(
      shoes: Shoes(
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
  new ProductContainer(
    stories: Product(
      shoes: Shoes(
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
  new ProductContainer(
    stories: Product(
      shoes: Shoes(
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
  new ProductContainer(
    stories: Product(
      shoes: Shoes(
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
