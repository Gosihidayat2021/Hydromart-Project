class CartModel {
  late String name, image, price, productId,more;
  late int quantity;

  CartModel({
    required this.name,
    required this.image,
    required this.price,
    required this.productId,
    required this.more,
    this.quantity = 1,
  });

  CartModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    price = map['price'];
    productId = map['productId'];
    more = map['more'];
    quantity = map['quantity'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'productId': productId,
      'more': more,
      'quantity': quantity,
    };
  }
}
