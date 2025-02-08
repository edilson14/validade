import 'package:result_dart/result_dart.dart';
import 'package:validade/src/data/services/shop_service.dart';
import 'package:validade/src/domain/dto/shop_parans.dart';
import 'package:validade/src/domain/enteties/shop_entetie.dart';
import 'package:validade/src/domain/repositories/shop_repositorie_interface.dart';

class ShopRepositore implements ShopRepositorieInterface {
  final ShopService _shopService;

  ShopRepositore(this._shopService);

  @override
  AsyncResult<Unit> createShop(String shop) {
    return _shopService.saveShop(shop);
  }

  @override
  AsyncResult<Unit> deleteShop(ShopParans shop) {
    // TODO: implement deleteShop
    throw UnimplementedError();
  }

  @override
  AsyncResult<List<ShopEntetie>> getShops() {
    return _shopService.getShops();
  }
}
