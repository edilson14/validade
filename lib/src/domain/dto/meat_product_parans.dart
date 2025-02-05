import 'package:validade/src/domain/dto/product_params.dart';
import 'package:validade/src/domain/dto/shop_parans.dart';

class MeatProductParans {
  String frezzerID;
  ShopParans shopParans;
  ProductParams productParams;

  MeatProductParans({
    required this.frezzerID,
    required this.shopParans,
    required this.productParams,
  });

  factory MeatProductParans.fromEmpty() => MeatProductParans(
        frezzerID: '',
        shopParans: ShopParans.fromEmpty(),
        productParams: ProductParams.fromEmpty(),
      );

  void setFrezzerID(String newFrezzerID) {
    frezzerID = newFrezzerID;
  }
}
