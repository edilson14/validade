import 'package:validade/src/domain/dto/shop_parans.dart';
import 'package:validade/src/domain/enteties/shop_entetie.dart';

class ShopAdapter {
  ShopEntetie shopFromJson(Map<String, dynamic> json) {
    return ShopEntetie(
      name: json['name'],
      cep: json['cep'],
      address: json['address'],
    );
  }

  ShopEntetie shopEntetieFromParans(ShopParans shop) {
    return ShopEntetie(
      name: shop.name,
      cep: shop.cep,
      address: shop.address,
    );
  }
}
