import 'package:validade/src/domain/enteties/shop_entetie.dart';

class ShopAdapter {
  ShopEntetie shopFromJson(Map<String, dynamic> json) {
    return ShopEntetie(
      name: json['name'],
      cep: json['cep'],
      address: json['address'],
    );
  }
}
