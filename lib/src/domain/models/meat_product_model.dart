import 'package:validade/src/domain/models/product_model.dart';
import 'package:validade/src/domain/models/shop_model.dart';

class MeatProductModel extends ProductModel {
  final String frezzerID;
  final ShopModel shopModel;

  MeatProductModel({
    required super.validateDate,
    required super.name,
    required super.lote,
    required this.frezzerID,
    required this.shopModel,
  });
}
