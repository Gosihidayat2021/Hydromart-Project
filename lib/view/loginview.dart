import 'package:hydromart/view/themes/appbartheme.dart';
import 'package:hydromart/view/themes/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controller/auth_view_controller.dart';

import './widget/text_form_field.dart';
import './widget/custom_buttom.dart';
import './widget/custom_text.dart';

class LoginView extends GetWidget<AuthViewController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundAwal,
        appBar: CustomAppBar('LOGIN'),
        body: Padding(
          padding: EdgeInsets.all(30.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomText(
                  text: "Selamat Datang",
                  fontSize: 32,
                  color: primaryColor,
                  alignment: Alignment.center,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 10.h,
                ),
                const CustomText(
                  text: "Silahkan login ke akun yang sudah ada",
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 50.h,
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
                  height: 20.h,
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
                  height: 100.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CustomButton(
                    'Login',
                    () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        controller.signInWithEmailAndPassword();
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
