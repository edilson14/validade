import 'package:result_dart/result_dart.dart';
import 'package:validade/src/domain/dto/shop_parans.dart';
import 'package:validade/src/domain/enteties/shop_entetie.dart';
import 'package:validade/src/domain/repositories/shop_repositorie_interface.dart';

class ShopRepositore implements ShopRepositorieInterface {
  @override
  AsyncResult<Unit> createShop(ShopParans shop) {
    // TODO: implement createShop
    throw UnimplementedError();
  }

  @override
  AsyncResult<Unit> deleteShop(ShopParans shop) {
    // TODO: implement deleteShop
    throw UnimplementedError();
  }

  @override
  AsyncResult<List<ShopEntetie>> getShops() {
    // TODO: implement getShops
    throw UnimplementedError();
  }
}
