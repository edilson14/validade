class ProductParams {
  String name;
  String lote;
  DateTime validade;
  ProductParams({
    required this.name,
    required this.lote,
    required this.validade,
  });

  factory ProductParams.fromEmpty() => ProductParams(
        name: '',
        lote: '',
        validade: DateTime.now(),
      );

  setName(String name) {
    name = name;
  }

  setLote(String lote) {
    lote = lote;
  }

  setValidade(DateTime validade) {
    validade = validade;
  }
}
