import 'package:validade/src/domain/dto/product_params.dart';
import 'package:validade/src/domain/models/product_model.dart';

class ProductAdapter {
  ProductModel productModelFromParans(ProductParams product) {
    return ProductModel(
      validateDate: product.validade,
      name: product.name,
      lote: product.lote,
    );
  }

  ProductModel productFromJson(Map<String, dynamic> json) {
    return ProductModel(
      validateDate: DateTime.parse(json["validateDate"]),
      name: json['name'],
      lote: json['lote'],
    );
  }
}
