import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:validade/src/data/adapters/product_adapter.dart';
import 'package:validade/src/data/adapters/shop_adapter.dart';
import 'package:validade/src/data/repositories/shop_repositore.dart';
import 'package:validade/src/data/services/shop_service.dart';
import 'package:validade/src/domain/dto/product_params.dart';
import 'package:validade/src/domain/dto/shop_parans.dart';
import 'package:validade/src/domain/enteties/shop_entetie.dart';
import 'package:validade/src/domain/models/models.dart';
import 'package:validade/src/data/repositories/produc_repositore.dart';
import 'package:validade/src/data/services/product_service.dart';
import 'package:validade/src/domain/use_cases/shop_usecase/create_shop_secase.dart';

class ProductController extends ChangeNotifier {
  final _products = <ProductModel>[];
  final _shops = <ShopEntetie>[];

  List<ProductModel> get products => _products;
  List<ShopEntetie> get shops => _shops;

  final _productService = ProductService();
  final _shopService = ShopService();
  late final shopRepository = ShopRepositore(_shopService);

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

  void createShop(ShopParans shop) {
    _shops.add(ShopAdapter().shopEntetieFromParans(shop));

    CreateShopSecase(shopRepository)
        .call(jsonEncode(_shops.map((e) => e.toMap()).toList()));
    notifyListeners();
  }

  void loadShops() async {
    final shops = await shopRepository.getShops();
    shops.fold((l) {
      _shops.addAll(l);
      notifyListeners();
    }, (r) {});
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
