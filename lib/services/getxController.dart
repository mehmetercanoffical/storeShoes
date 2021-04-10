import 'package:get/get.dart';

// ignore: must_be_immutable
class GetCardController extends GetX {
  RxInt _cardItem = 0.obs;

  get cardItem => _cardItem;
  set cardItem(cardItem) => _cardItem = cardItem;

  int cardItemPlus() {
    cardItem++;
    print(cardItem);
  }

  void cardItemRemove() {
    cardItem--;
  }

  void add() {
    print(cardItem);
  }
}
