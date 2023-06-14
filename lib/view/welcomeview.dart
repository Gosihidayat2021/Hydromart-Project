import 'package:hydromart/controller/auth_view_controller.dart';
import 'package:hydromart/view/themes/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hydromart/view/loginview.dart';
import 'package:hydromart/view/register_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'widget/custom_text.dart';

class WelcomeView extends GetWidget<AuthViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundAwal,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                width: 220.w,
                height: 240.h,
                child: Image.asset(
                  "assets/ilus.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                text: "Selamat Datang",
                fontSize: 35,
                alignment: Alignment.center,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              const CustomText(
                text: "Memudahkan Pembudidayaan Tanaman Hidroponik",
                alignment: Alignment.center,
                fontSize: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                CustomText(
                text: "Bersama",
                alignment: Alignment.center,
                fontSize: 12,
              ),
              SizedBox(
                width: 5,
              ),
                CustomText(
                text: "HydroMart",
                alignment: Alignment.center,
                fontSize: 12,
                fontWeight:FontWeight.w900,
              ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                width: Get.width * 0.8,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => RegisterView());
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: CustomText(
                    text: 'Daftar Akun',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: backgroundAwal,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: Get.width * 0.8,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => LoginView());
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: backgroundAwal,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side:
                            BorderSide(width: 2, color: primaryColor),
                      )),
                  child:  CustomText(
                    text: 'Login',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "HydroMart @2023",
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
