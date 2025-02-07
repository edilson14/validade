import 'package:flutter/material.dart';
import 'package:validade/src/data/adapters/product_adapter.dart';
import 'package:validade/src/domain/dto/product_params.dart';
import 'package:validade/src/domain/models/models.dart';
import 'package:validade/src/data/repositories/produc_repositore.dart';
import 'package:validade/src/data/services/product_service.dart';

class ProductController extends ChangeNotifier {
  final _products = <ProductModel>[];

  List<ProductModel> get products => _products;

  final _productService = ProductService();

  late final productrepository = ProducRepositore(_productService);

  ProductModel product(int index) {
    return _products[index];
  }

  void createProduct(ProductParams product) {
    _products.add(ProductAdapter().productModelFromParans(product));
    _sortProducts();
    // _productService
    //     .saveProduct(jsonEncode(_products.map((e) => e.toMap()).toList()));
    notifyListeners();
  }

  void _sortProducts() {
    _products.sort((a, b) => a.validateDate.compareTo(b.validateDate));
  }

  void loadProducts() async {
    // final products =
    await productrepository.getProducts();
    // products.fold((l) => null, (r) {
    //   _products.add(r);
    //   notifyListeners();
    // });
    // _products = products;
    _sortProducts();
    notifyListeners();
  }
}
