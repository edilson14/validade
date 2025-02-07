// ignore_for_file: public_member_api_docs, sort_constructors_first
class ShopEntetie {
  String name;
  String address;
  String cep;
  ShopEntetie({
    required this.name,
    required this.address,
    required this.cep,
  });

  factory ShopEntetie.fromJson(Map<String, dynamic> json) {
    return ShopEntetie(
      name: json['name'],
      cep: json['cep'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cep': cep,
      'address': address,
    };
  }
}
