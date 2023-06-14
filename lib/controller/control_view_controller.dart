import 'package:hydromart/controller/home_view_controller.dart';
import 'package:hydromart/view/home_view.dart';
import 'package:hydromart/view/maps_view.dart';
import 'package:hydromart/view/profile_view.dart';
import 'package:hydromart/view/scan_qr_view.dart';
import 'package:hydromart/view/transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewCont extends GetxController {
  Widget _currentScreen = const HomeView();
  int _navigatorIndex = 0;

  Widget get currentScreen => _currentScreen;

  int get navigatorIndex => _navigatorIndex;

  @override
  void onInit() {
    Get.put(HomeViewController());
    super.onInit();
  }

  changeCurrentScreen(int index) {
    update();
    _navigatorIndex = index;
    switch (index) {
      case 0:
        _currentScreen = const HomeView();
        break;
      case 1:
        _currentScreen = MapsView();
        break;
      case 2:
        _currentScreen = ScanqrView();
        break;
      case 3:
        _currentScreen = TransactionView();
        break;
      case 4:
        _currentScreen = ProfileView();
        break;
    }
    update();
  }
  
}
