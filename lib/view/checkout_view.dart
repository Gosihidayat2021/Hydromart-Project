import 'package:hydromart/view/themes/appbartheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hydromart/view/themes/color.dart';

import '../controller/cart_view_controller.dart';
import '../controller/checkout_controller.dart';
import './widget/custom_buttom.dart';
import './widget/custom_text.dart';
import './widget/text_form_field.dart';

class CheckoutView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Checkout"),
      backgroundColor: Colors.white,
      // bottomNavigationBar: CustomBottomNavigationBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 20.h, right: 16.w, left: 16.w, bottom: 24.h),
                child: Form(
                  key: _formKey,
                  child: GetBuilder<CheckoutViewController>(
                    init: CheckoutViewController(),
                    builder: (controller) => Column(
                      children: [
                        ListViewProducts(),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField2(
                          title: 'Nama',
                          hintText: 'nama pemesan',
                          validatorFn: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please enter valid name.';
                            }
                            return null;
                          },
                          onSavedFn: (value) {
                            controller.name = value;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField2(
                          title: 'Addres',
                          hintText: 'alamat pemesan',
                          validatorFn: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please enter valid addres.';
                            }
                            return null;
                          },
                          onSavedFn: (value) {
                            controller.address = value;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField2(
                          title: 'Phone Number',
                          hintText: '+62',
                          keyboardType: TextInputType.phone,
                          validatorFn: (value) {
                            if (value!.isEmpty || value.length < 10) {
                              return 'Please enter valid number.';
                            }
                            return null;
                          },
                          onSavedFn: (value) {
                            controller.phone = value;
                          },
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText2(
                                  text: "TOTAL",
                                  fontSize: 18,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                GetBuilder<CartViewController>(
                                    init: Get.find(),
                                    builder: (controller) => CustomText2(
                                          text: '${controller.totalPrice.toInt()}',fontSize: 30,
                                        ))
                              ],
                            ),
                            SizedBox(
                            width: 200.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child:CustomButton2(
                                        'BUAT PESANAN',
                                        () async {
                                          if (_formKey.currentState!.validate()) {
                                            _formKey.currentState!.save();
                                            await controller.addCheckoutToFireStore();
                                            Get.dialog(
                                              AlertDialog(
                                                content: SizedBox(
                                                  width: 200,
                                                  height: 200,
                                                  child: Column(
                                                    children: [
                                                      Icon(
                                                        Icons.check_circle_outline_outlined,
                                                        color: primaryColor,
                                                        size: 50.h,
                                                      ),
                                                      CustomText(
                                                        text: 'Order Submitted',
                                                        fontSize: 24,
                                                        fontWeight: FontWeight.bold,
                                                        color: primaryColor,
                                                        alignment: Alignment.center,
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      CustomButton2(
                                                        'Done',
                                                        () {
                                                          Get.back();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              barrierDismissible: false,
                                            );
                                          }
                                        },
                                      ),

                            ),
                          )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewController>(
      builder: (controller) => Column(
        children: [
          SizedBox(
            height: 160.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.cartProducts.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 120.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Colors.black12,width: 0.7),
                          color: Colors.white,
                        ),
                        height: 120.h,
                        padding: const EdgeInsets.all(10),
                        width: 120.w,
                        child: Image.network(
                          controller.cartProducts[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CustomText2(
                          text: controller.cartProducts[index].name,
                          fontSize: 14,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CustomText(
                          text:
                              'Rp. ${controller.cartProducts[index].price} x ${controller.cartProducts[index].quantity}',
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 15.w,
                );
              },
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }
}
