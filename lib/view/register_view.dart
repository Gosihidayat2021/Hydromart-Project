import 'package:hydromart/view/themes/appbartheme.dart';
import 'package:hydromart/view/themes/color.dart';
import 'package:hydromart/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../controller/auth_view_controller.dart';

import '../view/widget/custom_buttom.dart';
import '../view/widget/text_form_field.dart';

class RegisterView extends GetWidget<AuthViewController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundAwal,
        appBar: CustomAppBar('DAFTAR AKUN'),
        body: Padding(
          padding: EdgeInsets.all(30.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomText(
                  text: "Buat Akun Baru",
                  fontSize: 32,
                  alignment: Alignment.center,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CustomText(
                  text: "Silahkan Membuat Akun Baru Anda",
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomTextFormField(
                  title: 'Nama',
                  hintText: 'name',
                  keyboardType: TextInputType.emailAddress,
                  validatorFn: (value) {
                    if (value!.isEmpty) return 'Email invalid or not found';
                    return null;
                  },
                  onSavedFn: (value) {
                    controller.name = value;
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  title: 'Email',
                  hintText: 'your@mail.com',
                  keyboardType: TextInputType.emailAddress,
                  validatorFn: (value) {
                    if (value!.isEmpty) return 'Email invalid or not found';
                    return null;
                  },
                  onSavedFn: (value) {
                    controller.email = value;
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  title: 'Password',
                  hintText: 'password',
                  obscureText: true,
                  validatorFn: (value) {
                    if (value!.isEmpty) return 'Password is incorrect';
                    return null;
                  },
                  onSavedFn: (value) {
                    controller.password = value;
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CustomButton(
                    'Daftar Akun',
                    () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        controller.registerWithEmailAndPassword();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Spacer(),
                Text(
                  "HydroMart @2023",
                  style: TextStyle(
                    color: primaryColor,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
