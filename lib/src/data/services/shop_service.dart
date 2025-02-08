import 'dart:convert';

import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validade/src/data/adapters/shop_adapter.dart';
import 'package:validade/src/domain/enteties/enteties.dart';

const String shopKey = 'shop';

class ShopService {
  AsyncResult<Unit> saveShop(String shop) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(shopKey, shop);
      return const Success(unit);
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  AsyncResult<List<ShopEntetie>> getShops() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var shop = jsonDecode(prefs.getString(shopKey) ?? '[]');

      return Success(
          shop.map<ShopEntetie>((e) => ShopAdapter().shopFromJson(e)).toList());
    } catch (e) {
      return const Success(<ShopEntetie>[]);
    }
  }
}
