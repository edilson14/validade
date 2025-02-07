import 'dart:convert';

import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validade/src/data/adapters/product_adapter.dart';
import 'package:validade/src/domain/dto/meat_product_parans.dart';
import 'package:validade/src/domain/enteties/enteties.dart';
import 'package:validade/src/domain/models/product_model.dart';

String productkey = 'product';

class ProductService {
  AsyncResult<Unit> saveProduct(MeatProductParans product) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(productkey, product.toString());
      return const Success(unit);
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  AsyncResult<List<MeatEntetie>> getProducts() async {
    final prefs = await SharedPreferences.getInstance();
    var product = jsonDecode(prefs.getString(productkey) ?? '[]');

    return product
        .map<ProductModel>((e) => ProductAdapter().productFromJson(e))
        .toList();
  }

  AsyncResult<Unit> deleteProduct(MeatProductParans product) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove(productkey);
      return const Success(unit);
    } catch (e) {
      return AsyncResult.error(e);
    }
  }
}
