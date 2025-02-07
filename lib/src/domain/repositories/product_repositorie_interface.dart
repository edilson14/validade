import 'package:result_dart/result_dart.dart';
import 'package:validade/src/domain/dto/meat_product_parans.dart';
import 'package:validade/src/domain/enteties/meat_entetie.dart';

abstract interface class ProductRepositorieInterface {
  AsyncResult<List<MeatEntetie>> getProducts();
  AsyncResult<Unit> createProduct(MeatProductParans product);
  AsyncResult<Unit> deleteProduct(MeatProductParans product);
  AsyncResult<Unit> editProduct(MeatProductParans product);
}
