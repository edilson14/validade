class ShopParans {
  String name;
  String address;
  String cep;

  ShopParans({
    required this.name,
    required this.address,
    required this.cep,
  });

  factory ShopParans.fromEmpty() => ShopParans(
        name: '',
        address: '',
        cep: '',
      );

  void setName(String newName) {
    name = newName;
  }

  void setAddress(String newAddress) {
    address = newAddress;
  }

  void setCep(String newCep) {
    cep = newCep;
  }
}
