import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:validade/src/models/models.dart';
import 'package:validade/src/services/product_service.dart';

class ProductController extends ChangeNotifier {
  final _products = <ProductModel>[];

  List<ProductModel> get products => _products;

  final _productService = ProductService();

  ProductModel product(int index) {
    return _products[index];
  }

  void createProduct(ProductModel product) {
    _products.add(product);
    _sortProducts();
    _productService
        .saveProduct(jsonEncode(_products.map((e) => e.toMap()).toList()));
    notifyListeners();
  }

  void _sortProducts() {
    _products.sort((a, b) => a.validateDate.compareTo(b.validateDate));
  }

  void loadProducts() async {
    final localproducts = await _productService.getProducts();
    _products.clear();
    _products.addAll(localproducts.map((e) => ProductModel().fromMap(e)));
    _sortProducts();
    notifyListeners();
  }
}
