import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydromart/view/themes/color.dart';
import 'package:hydromart/view/widget/custom_buttom.dart';
import 'package:hydromart/view/widget/custom_text.dart';

class ScanqrController extends GetxController {
  //TODO: Implement ScanqrController

  String scannedQrcode = "";

  @override
  void onClose() {}

  Future<void> scanQR() async {
    try {
      scannedQrcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff666666",
        'cancel',
        true,
        ScanMode.QR,
      );
      if (scannedQrcode != "-1") {
        Get.defaultDialog(
                title: 'Success',
                titleStyle:  GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor
                ),
                contentPadding: const EdgeInsets.all(20),
                middleText:  "QR code $scannedQrcode",
                middleTextStyle: GoogleFonts.roboto(
                fontSize: 16,
                ),
                confirm: CustomButton2('Done', (){
                  Get.back();
                })); 
      }
    } on PlatformException catch (e) {
      Get.defaultDialog(
                title: 'Failed',
                titleStyle:  GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red
                ),
                contentPadding: const EdgeInsets.all(20),
                middleText:  "QR eror ${e.message}",
                middleTextStyle: GoogleFonts.roboto(
                fontSize: 16,
                ),
                confirm: ElevatedButton(onPressed: (){Get.back();},
      style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                elevation: 2,
                padding: EdgeInsets.symmetric(vertical: 16.h),
              ),child: const CustomText(
                text: 'Done',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                alignment: Alignment.center,
              ),)
                ); 
    }
  }
  
}
