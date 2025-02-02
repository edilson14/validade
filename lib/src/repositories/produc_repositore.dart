import 'package:validade/src/models/product_model.dart';
import 'package:validade/src/services/product_service.dart';

class ProducRepositore {
  final ProductService _productService;

  ProducRepositore(this._productService);

  Future<List<ProductModel>> getAllProducts() async {
    return await _productService.getProducts();
  }

  void createProduct(ProductModel product) {}
}
