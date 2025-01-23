import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

String productkey = 'product';

class ProductService {
  Future<void> saveProduct(String product) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(productkey, product);
  }

  Future<List> getProducts() async {
    final prefs = await SharedPreferences.getInstance();
    var product = jsonDecode(prefs.getString(productkey) ?? '[]');

    return product.map((e) => e as Map).toList();
  }
}
