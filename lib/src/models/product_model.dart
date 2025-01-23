// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lucid_validation/lucid_validation.dart';

class ProductModel {
  final String id = DateTime.now().millisecondsSinceEpoch.toString();
  var validateDate = DateTime.now();
  var name = '';
  var lote = '';

  int get daysUntilValidate => validateDate.difference(DateTime.now()).inDays;

  Color get color => daysUntilValidate < 14 ? Colors.red : Colors.grey;

  String validateInDays() {
    final today = DateTime.now();
    final difference = validateDate.difference(today);
    return difference.inDays.toString();
  }

  ProductModel fromMap(Map<String, dynamic> map) {
    name = map['name'];
    lote = map['lote'];
    validateDate = DateTime.parse(map['validateDate']);
    return this;
  }

  Map<String, String> toMap() {
    return {
      "id": id,
      "name": name,
      "lote": lote,
      "validateDate": validateDate.toIso8601String()
    };
  }
}

class ProductModelValidor extends LucidValidator<ProductModel> {
  ProductModelValidor() {
    final today = DateTime.now();

    ruleFor((product) => product.name, key: 'name') //
        .notEmpty(message: 'Nome nao deve ser vazio')
        .minLength(5, message: 'O Produto deve ter no mínimo 5 caracteres');

    ruleFor((product) => product.lote, key: 'lote') //
        .notEmpty(message: 'Lote nao deve ser vazio')
        .minLength(5, message: 'O Lote deve ter no mínimo 5 caracteres')
        .mustHaveNumber(message: 'Lote deve conter pelo menos um numero');

    ruleFor((product) => product.validateDate, key: 'validateDate') //
        .isNotNull(message: 'A data de validade nao deve ser vazia')
        .greaterThan(
          today,
          message: 'A data de validade deve ser maior que a data atual',
        );
  }
}
