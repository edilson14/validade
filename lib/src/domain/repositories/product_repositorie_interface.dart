import 'package:result_dart/result_dart.dart';
import 'package:validade/src/domain/enteties/meat_entetie.dart';
import 'package:validade/src/domain/models/product_model.dart';

abstract interface class ProductRepositorieInterface {
  AsyncResult<List<MeatEntetie>> getProducts();
  AsyncResult<MeatEntetie> createProduct(ProductModel product);
  AsyncResult<Unit> deleteProduct(ProductModel product);
}
