import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydromart/view/themes/color.dart';

import '../services/cart_database.dart';
import '../../model/cart_model.dart';

class CartViewController extends GetxController {
  List<CartModel> _cartProducts = [];

  List<CartModel> get cartProducts => _cartProducts;

  double _totalPrice = 0;
  final List<String> _totalBarang = [];

  double get totalPrice => _totalPrice;

  List<String>? get barang => _totalBarang;

  @override
  void onInit() {
    super.onInit();
    getCartProducts();
  }

  getCartProducts() async {
    _cartProducts = await LocalDatabaseCart.db.getAllProducts();
    getTotalPrice();
    print(_cartProducts.length);
    update();
  }

  addProduct(CartModel cartModel) async {
    bool isExist = false;
    for (var element in _cartProducts) {
      if (element.productId == cartModel.productId) {
        isExist = true;
      }
    }
    if (!isExist) {
      await LocalDatabaseCart.db.insertProduct(cartModel);
      getCartProducts();
      update();
    }else{
      for (var element in _cartProducts) {
        if (element.productId == cartModel.productId){
          element.quantity++;
          await LocalDatabaseCart.db.update(element);
          update();
        }
      }
    }
    Get.snackbar('SUCCES','Berhasil Ditambahkan',
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 1),
    backgroundColor: backgroundAwal.withOpacity(0.9),
    margin: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
    icon: const Icon(Icons.check_circle_rounded,size: 30,),
    borderRadius: 20,
    barBlur: 0);
  }

  removeProduct(String productId) async {
    await LocalDatabaseCart.db.deleteProduct(productId);
    getCartProducts();
  }

  removeAllProducts() async {
    await LocalDatabaseCart.db.deleteAllProducts();
    getCartProducts();
  }

  getTotalPrice() {
    _totalPrice = 0;
    for (var cartProduct in _cartProducts) {
      _totalPrice += (double.parse(cartProduct.price) * cartProduct.quantity);
    }
  }

  getTotalBarang() {
    for (var cartProduct in _cartProducts) {
      _totalBarang.insert(0, cartProduct.name);
    }
  }

  increaseQuantity(int index) async {
    _cartProducts[index].quantity++;
    getTotalPrice();
    await LocalDatabaseCart.db.update(_cartProducts[index]);
    update();
  }

  decreaseQuantity(int index) async {
    if (_cartProducts[index].quantity != 0) {
      _cartProducts[index].quantity--;
      getTotalPrice();
      await LocalDatabaseCart.db.update(_cartProducts[index]);
      update();
    }
  }
}
