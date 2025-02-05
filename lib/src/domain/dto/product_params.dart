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

  void setName(String newName) {
    name = newName;
  }

  void setLote(String newLote) {
    lote = newLote;
  }

  void setValidade(DateTime novoValidade) {
    validade = novoValidade;
  }
}
