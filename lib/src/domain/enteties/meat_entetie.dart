import 'package:validade/src/domain/enteties/enteties.dart';

class MeatEntetie {
  String frezzerID;
  ShopEntetie shopEntetie;
  ProductEntetie productEntetie;

  MeatEntetie({
    required this.frezzerID,
    required this.shopEntetie,
    required this.productEntetie,
  });
}
