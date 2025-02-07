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

  factory MeatEntetie.fromJson(Map<String, dynamic> json) {
    return MeatEntetie(
      frezzerID: json["frezzerID"],
      shopEntetie: ShopEntetie.fromJson(json['shopEntetie']),
      productEntetie: ProductEntetie.fromJson(json['productEntetie']),
    );
  }
}
