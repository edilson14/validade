import 'package:result_dart/result_dart.dart';
import 'package:validade/src/domain/repositories/shop_repositorie_interface.dart';

class CreateShopSecase {
  final ShopRepositorieInterface _shopRepository;

  CreateShopSecase(this._shopRepository);

  AsyncResult<Unit> call(String shop) async {
    return await _shopRepository.createShop(shop);
  }
}
