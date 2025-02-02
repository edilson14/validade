import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:validade/src/adapters/product_adapter.dart';
import 'package:validade/src/models/product_model.dart';

String productkey = 'product';

class ProductService {
  Future<void> saveProduct(String product) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(productkey, product);
  }

  Future<List<ProductModel>> getProducts() async {
    final prefs = await SharedPreferences.getInstance();
    var product = jsonDecode(prefs.getString(productkey) ?? '[]');

    return product
        .map<ProductModel>((e) => ProductAdapter().productFromJson(e))
        .toList();
  }
}
