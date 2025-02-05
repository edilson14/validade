import 'package:result_dart/result_dart.dart';
import 'package:validade/src/domain/dto/shop_parans.dart';

import '../enteties/shop_entetie.dart';

abstract interface class ShopRepositorieInterface {
  AsyncResult<List<ShopEntetie>> getShops();
  AsyncResult<ShopEntetie> createShop(ShopParans shop);
  AsyncResult<Unit> deleteShop(ShopParans shop);
  AsyncResult<Unit> updateShop(ShopParans shop);
}
