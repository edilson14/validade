import 'dart:convert';

import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validade/src/data/adapters/shop_adapter.dart';
import 'package:validade/src/domain/dto/shop_parans.dart';
import 'package:validade/src/domain/enteties/enteties.dart';

const String shopKey = 'shop';

class ShopService {
  AsyncResult<Unit> saveShop(ShopParans shop) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(shopKey, shop.toString());
      return const Success(unit);
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  AsyncResult<List<ShopEntetie>> getShops() async {
    final prefs = await SharedPreferences.getInstance();
    var shop = jsonDecode(prefs.getString(shopKey) ?? '[]');

    return shop.map<ShopEntetie>((e) => ShopAdapter().shopFromJson(e)).toList();
  }
}
