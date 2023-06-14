import 'package:hydromart/view/themes/appbartheme.dart';
import 'package:hydromart/view/widget/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/scan_qr_controller.dart';

class ScanqrView extends GetView<ScanqrController> {
  final scanqrC = Get.put(ScanqrController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2('QR scan'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CustomButton2('SCAN QR', () {
                scanqrC.scanQR();
              }),
            ),
          ),
        ],
      ),
    );
  }
}
