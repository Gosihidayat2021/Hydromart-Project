import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydromart/controller/maps_view_controller.dart';

import '../model/products_model.dart';

import '../services/flutter_product.dart';

class HomeViewController extends GetxController {
  final List<ProductModel> _products = [];
  List<ProductModel> get products => _products;
  final MapsViewController mapsC = Get.put(MapsViewController());
  bool _loading = false;

  bool get loading => _loading;


  @override
  void onInit() async {
    super.onInit();
    await getProductsFromFireStore();
    await mapsC.getLocation();
  }

  getProductsFromFireStore() async {
    try {
      _loading = true;
      FirestoreProduct().getProductsFromFirestore().then((value) {
        for (int i = 0; i < value.length; i++) {
          print(value[i].data());
        }
      });
      List<QueryDocumentSnapshot> productsSnapshot =
          await FirestoreProduct().getProductsFromFirestore();
      debugPrint(productsSnapshot.length.toString());
      for (var product in productsSnapshot) {
        _products
            .add(ProductModel.fromJson(product.data() as Map<String, dynamic>));
      }
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
  Get.snackbar('FAILED',errorMessage,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 1),
    backgroundColor: Colors.red.withOpacity(0.7),
    overlayColor: Colors.transparent,
    colorText: Colors.white,
    margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
    icon: const Icon(Icons.not_interested_rounded,color: Colors.white,size: 30,),
    borderRadius: 20,
    barBlur: 0);
    }
    update();
  }
}
