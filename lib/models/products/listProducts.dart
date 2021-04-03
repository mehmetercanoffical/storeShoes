import 'package:store/models/shoes/company.dart';
import 'package:store/models/shoes/Catgory.dart';
import 'package:store/models/shoes/shoes.dart';
import 'package:store/models/products.dart';
import 'package:store/models/shoes/shoesColor.dart';
import 'package:store/pages/screen/productCompanent/productHorizontal.dart';
import 'package:store/style/sizeconfig.dart';

List<ProductContainer> getShoeses = [
  new ProductContainer(
    stories: Product(
      shoes: Shoes(
        id: 2,
        companyId: 1,
        isWowan: true,
        size: 35,
        price: 100,
        shoesImg: "$imgPath/shoes1.png",
        name: 'Nike ISPA Overreact Sail Multi',
        shoesColor: ShoesColor(
          id: 1,
          name: "black",
        ),
      ),
      company: Company(
        id: 1,
        logoImg: "$imgPath/nike.png",
        name: "Nike",
        allProducts: 9000,
        addressDate: "Ankara",
        descp: "En iyi Balance ayakkabıları burada",
        phoneNuber: 11111555555,
      ),
      category: Category(
        id: 20,
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
        companyId: 1,
        isWowan: true,
        size: 35,
        price: 100,
        shoesImg: "$imgPath/shoes1.png",
        name: 'Nike ISPA Overreact Sail Multi',
        shoesColor: ShoesColor(
          id: 1,
          name: "black",
        ),
      ),
      company: Company(
        id: 1,
        logoImg: "$imgPath/vans.png",
        name: "Balance",
        allProducts: 9000,
        addressDate: "Ankara",
        descp: "En iyi Balance ayakkabıları burada",
        phoneNuber: 11111555555,
      ),
      category: Category(
        id: 20,
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
        companyId: 1,
        isWowan: true,
        size: 35,
        shoesImg: "$imgPath/shoes1.png",
        shoesColor: ShoesColor(id: 1, name: "black"),
        name: 'Nike ISPA Overreact Sail Multi',
      ),
      company: Company(
        id: 1,
        logoImg: "$imgPath/vans.png",
        name: "Balance",
        allProducts: 9000,
        addressDate: "Ankara",
        descp: "En iyi Balance ayakkabıları burada",
        phoneNuber: 11111555555,
      ),
      category: Category(id: 20, imgUrl: "", name: "Sports"),
      //views: Views(like: 100, views: 1500),
    ),
  ),
  new ProductContainer(
    stories: Product(
      shoes: Shoes(
        id: 2,
        companyId: 1,
        isWowan: true,
        size: 35,
        price: 50,
        shoesImg: "$imgPath/shoes2.png",
        shoesColor: ShoesColor(id: 1, name: "black"),
        name: 'Nike ISPA Overreact Sail Multi',
      ),
      company: Company(
        id: 1,
        logoImg: "$imgPath/vans.png",
        name: "Balance",
        allProducts: 9000,
        addressDate: "İstanbul",
        descp: "En iyi Balance ayakkabıları burada",
        phoneNuber: 11111555555,
      ),
      category: Category(id: 2, imgUrl: "", name: "Sports"),
      //views: Views(like: 100, views: 1500),
    ),
  ),
  new ProductContainer(
    stories: Product(
      shoes: Shoes(
        companyId: 2,
        isWowan: true,
        size: 35,
        id: 14,
        price: 100,
        shoesImg: "$imgPath/shoes2.png",
        shoesColor: ShoesColor(id: 1, name: "black"),
        name: 'Addidas ISPA Overreact Sail Multi',
      ),
      company: Company(
        id: 2,
        addressDate: "İstanbul/Umraniye",
        descp: "En iyi Addidas ayakkabıları burada",
        phoneNuber: 11111555555,
        logoImg: "$imgPath/vans.png",
        name: "Addidas",
        allProducts: 100,
      ),
      category: Category(
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
        companyId: 1,
        isWowan: true,
        shoesColor: ShoesColor(id: 1, name: "black"),
        size: 35,
        id: 6,
        price: 300,
        shoesImg: "$imgPath/shoes2.png",
        name: 'Addidas ISPA Overreact Sail Multi',
      ),
      company: Company(
        id: 1,
        logoImg: "$imgPath/vans.png",
        name: "Balance",
        allProducts: 9000,
        addressDate: "Ankara",
        descp: "En iyi Balance ayakkabıları burada",
        phoneNuber: 11111555555,
      ),
      category: Category(id: 2, imgUrl: "", name: "Wowan"),
      //views: Views(like: 100, views: 1500),
    ),
  ),
];
