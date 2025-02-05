import 'package:lucid_validation/lucid_validation.dart';
import 'package:validade/src/domain/models/meat_product_model.dart';

class MeatProductValidator extends LucidValidator<MeatProductModel> {
  MeatProductValidator(MeatProductModel meatProduct) {
    ruleFor((meatProduct) => meatProduct.frezzerID, key: 'frezzer') //
        .notEmpty(message: 'O campo não pode ser vazio')
        .minLength(3, message: 'O campo deve ter no mínimo 3 caracteres')
        .mustHaveNumber(message: 'O campo deve conter números');
  }
}
