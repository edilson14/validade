import 'package:result_dart/result_dart.dart';
import 'package:validade/src/domain/enteties/enteties.dart';
import 'package:validade/src/domain/repositories/shop_repositorie_interface.dart';

class GetShopusecase {
  final ShopRepositorieInterface _shopRepository;

  GetShopusecase(this._shopRepository);

  AsyncResult<List<ShopEntetie>> call() async {
    return await _shopRepository.getShops();
  }
}
