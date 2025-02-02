import 'package:lucid_validation/lucid_validation.dart';
import 'package:validade/src/dto/product_params.dart';

class ProductParamsValidator extends LucidValidator<ProductParams> {
  ProductParamsValidator() {
    final today = DateTime.now();

    ruleFor((product) => product.name, key: 'name') //
        .notEmpty(message: 'Nome nao deve ser vazio')
        .minLength(5, message: 'O Produto deve ter no mínimo 5 caracteres');

    ruleFor((product) => product.lote, key: 'lote') //
        .notEmpty(message: 'Lote nao deve ser vazio')
        .minLength(5, message: 'O Lote deve ter no mínimo 5 caracteres')
        .mustHaveNumber(message: 'Lote deve conter pelo menos um numero');

    ruleFor((product) => product.validade, key: 'validateDate') //
        .isNotNull(message: 'A data de validade nao deve ser vazia')
        .greaterThan(
          today,
          message: 'A data de validade deve ser maior que a data atual',
        );
  }
}
