import 'package:result_dart/result_dart.dart';
import 'package:validade/src/domain/dto/meat_product_parans.dart';
import 'package:validade/src/domain/repositories/product_repositorie_interface.dart';

class CreateProductUsecase {
  final ProductRepositorieInterface _meatProductRepository;

  CreateProductUsecase(this._meatProductRepository);

  AsyncResult<Unit> call(MeatProductParans meatProductEntity) async {
    return await _meatProductRepository.createProduct(meatProductEntity);
  }
}
