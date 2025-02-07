class ProductEntetie {
  String name;
  String lote;
  DateTime validade;

  ProductEntetie({
    required this.name,
    required this.lote,
    required this.validade,
  });

  factory ProductEntetie.fromJson(Map<String, dynamic> json) {
    return ProductEntetie(
      name: "name",
      lote: "lote",
      validade: DateTime.now(),
    );
  }
}
