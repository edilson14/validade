import 'package:lucid_validation/lucid_validation.dart';
import 'package:validade/src/domain/dto/shop_parans.dart';

class ShopParansValidator extends LucidValidator<ShopParans> {
  ShopParansValidator() {
    ruleFor((shopParans) => shopParans.cep, key: 'cep') //
        .notEmpty(message: 'CEP nao deve ser vazio')
        .mustHaveNumber(message: 'CEP deve conter apenas numeros')
        .minLength(8, message: 'CEP deve ter no mínimo 8 caracteres');

    ruleFor((shopParans) => shopParans.name, key: 'name') //
        .notEmpty(message: 'Nome nao deve ser vazio')
        .minLength(5, message: 'O Nome deve ter no mínimo 5 caracteres');

    ruleFor((shopParans) => shopParans.address, key: 'address') //
        .notEmpty(message: 'Endereço nao deve ser vazio')
        .minLength(5, message: 'O Endereço deve ter no mínimo 5 caracteres');
  }
}
