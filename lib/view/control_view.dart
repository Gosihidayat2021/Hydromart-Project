import 'package:hydromart/controller/auth_view_controller.dart';
import 'package:hydromart/view/themes/color.dart';
import 'package:hydromart/view/welcomeview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/control_view_controller.dart';


class ControlView extends GetWidget<AuthViewController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthViewController>().user == null
          ? WelcomeView()
          : GetBuilder<ControlViewCont>(
              init: ControlViewCont(),
              builder: (controller) => Scaffold(
                    body: controller.currentScreen,
                    bottomNavigationBar: CustomBottomNavigationBar(),
                  ));
    });
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: GetBuilder<ControlViewCont>(
        builder: (controller) => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: controller.navigatorIndex,
          onTap: (index) async {
            await controller.changeCurrentScreen(index);
          },
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.storefront_outlined,
                color: primaryColor,
              ),
              label: "PRODUK",
              activeIcon: Icon(
                Icons.storefront_outlined,
                color: secondaryColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on_outlined,
                color: primaryColor,
              ),
              label: "LOKASI",
              activeIcon: Icon(
                Icons.location_on_outlined,
                color: secondaryColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code_scanner_outlined,
                color: primaryColor,
              ),
              label: "SCAN QR",
              activeIcon: Icon(
                Icons.qr_code_scanner_outlined,
                color: secondaryColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment_outlined,
                color: primaryColor,
              ),
              label: "TRANSAKSI",
              activeIcon: Icon(
                Icons.assignment_outlined,
                color: secondaryColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: primaryColor,
              ),
              label: "PROFIL",
              activeIcon: Icon(
                Icons.account_circle_outlined,
                color: secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
