import 'package:result_dart/result_dart.dart';
import 'package:validade/src/domain/dto/meat_product_parans.dart';
import 'package:validade/src/domain/repositories/product_repositorie_interface.dart';

class DeleteProductUsecase {
  final ProductRepositorieInterface _meatProductRepository;

  DeleteProductUsecase(this._meatProductRepository);

  AsyncResult<Unit> call(MeatProductParans product) async {
    return _meatProductRepository.deleteProduct(product);
  }
}
