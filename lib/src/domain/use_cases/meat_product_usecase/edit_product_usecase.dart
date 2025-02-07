import 'package:validade/src/domain/dto/meat_product_parans.dart';
import 'package:validade/src/domain/repositories/product_repositorie_interface.dart';

class EditProductUsecase {
  final ProductRepositorieInterface _meatProductRepository;

  EditProductUsecase(this._meatProductRepository);

  Future<void> call(MeatProductParans product) async {
    await _meatProductRepository.editProduct(product);
  }
}
