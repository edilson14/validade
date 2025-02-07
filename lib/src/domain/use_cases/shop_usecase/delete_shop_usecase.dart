import 'package:result_dart/result_dart.dart';
import 'package:validade/src/domain/dto/shop_parans.dart';
import 'package:validade/src/domain/repositories/shop_repositorie_interface.dart';

class DeleteShopUsecase {
  final ShopRepositorieInterface _shopRepository;

  DeleteShopUsecase(this._shopRepository);

  AsyncResult<Unit> call(ShopParans shop) async {
    return _shopRepository.deleteShop(shop);
  }
}
