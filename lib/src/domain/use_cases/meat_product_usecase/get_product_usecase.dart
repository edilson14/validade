import 'package:result_dart/result_dart.dart';
import 'package:validade/src/domain/enteties/meat_entetie.dart';
import 'package:validade/src/domain/repositories/product_repositorie_interface.dart';

class GetProductUsecase {
  final ProductRepositorieInterface _meatProductRepository;

  GetProductUsecase(this._meatProductRepository);

  AsyncResult<List<MeatEntetie>> call() async {
    return _meatProductRepository.getProducts();
  }
}
