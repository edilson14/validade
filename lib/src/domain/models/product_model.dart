import 'package:flutter/material.dart';

class ProductModel {
  final String id = DateTime.now().millisecondsSinceEpoch.toString();
  final DateTime validateDate;
  final String name;
  final String lote;

  ProductModel({
    required this.validateDate,
    required this.name,
    required this.lote,
  });

  int get daysUntilValidate => validateDate.difference(DateTime.now()).inDays;

  Color get color => daysUntilValidate < 14 ? Colors.red : Colors.grey;

  String validateInDays() {
    final today = DateTime.now();
    final difference = validateDate.difference(today);
    return difference.inDays.toString();
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
