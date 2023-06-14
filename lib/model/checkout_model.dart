class CheckoutModel {
  late String name, address, phone, totalPrice, date;

  CheckoutModel({
    required this.name,
    required this.address,
    required this.phone,
    required this.totalPrice,
    required this.date,
  });

  CheckoutModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    address = map['address'];
    phone = map['phone'];
    totalPrice = map['totalPrice'];
    date = map['date'];
  }

  toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'totalPrice': totalPrice,
      'date': date,
    };
  }
}
