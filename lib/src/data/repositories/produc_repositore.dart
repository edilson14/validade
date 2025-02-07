import 'package:result_dart/result_dart.dart';
import 'package:validade/src/domain/dto/meat_product_parans.dart';
import 'package:validade/src/domain/enteties/enteties.dart';
import 'package:validade/src/data/services/product_service.dart';
import 'package:validade/src/domain/repositories/product_repositorie_interface.dart';

class ProducRepositore implements ProductRepositorieInterface {
  final ProductService _productService;

  ProducRepositore(this._productService);

  @override
  AsyncResult<List<MeatEntetie>> getProducts() async {
    try {
      var product = await _productService.getProducts();
      return product;
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  @override
  AsyncResult<Unit> createProduct(MeatProductParans product) async {
    try {
      await _productService.saveProduct(product);

      return const Success(unit);
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  @override
  AsyncResult<Unit> deleteProduct(MeatProductParans product) async {
    try {
      await _productService.deleteProduct(product);

      return const Success(unit);
    } catch (e) {
      return AsyncResult.error(e);
    }
  }
}
