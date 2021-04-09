import 'package:get/get.dart';

// ignore: must_be_immutable
class GetCardController extends GetX {
  RxInt _cardItem = 0.obs;

  get cardItem => _cardItem;
  set cardItem(cardItem) => _cardItem = cardItem;

  void cardItemPlus() {
    cardItem++;
  }

  void cardItemRemove() {
    cardItem--;
  }
}
