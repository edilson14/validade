import 'package:result_dart/result_dart.dart';
import 'package:validade/src/domain/dto/shop_parans.dart';

import '../enteties/shop_entetie.dart';

abstract interface class ShopRepositorieInterface {
  AsyncResult<List<ShopEntetie>> getShops();
  AsyncResult<Unit> createShop(String shop);
  AsyncResult<Unit> deleteShop(ShopParans shop);
}
