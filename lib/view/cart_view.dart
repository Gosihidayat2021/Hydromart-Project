import 'package:hydromart/controller/cart_view_controller.dart';
import 'package:hydromart/view/themes/appbartheme.dart';
import 'package:hydromart/view/widget/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './widget/custom_text.dart';
import 'checkout_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('KERANJANG'),
      backgroundColor: Colors.white,
      // bottomNavigationBar: CustomBottomNavigationBar(),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewController>(
              init: Get.put(CartViewController()),
              builder: (controller) => Container(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 120.h,
                              child: Image.network(
                                controller.cartProducts[index].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText2(
                                    text: controller.cartProducts[index].name.toUpperCase(),
                                    fontWeight: FontWeight.w500,
                                    maxLines: 2,
                                    fontSize: 20,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        text:
                                            'Rp. ${controller.cartProducts[index].price.toString()}',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      CustomText(
                                        text:
                                            '/${controller.cartProducts[index].more.toString()}',
                                            fontSize: 12,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 140,
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.increaseQuantity(index);
                                          },
                                          child: const Icon(Icons.add_circle),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        CustomText(
                                          alignment: Alignment.center,
                                          text: controller
                                              .cartProducts[index].quantity
                                              .toString(),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.decreaseQuantity(index);
                                          },
                                          child: const Icon(Icons.remove_circle),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.removeProduct(
                                    controller.cartProducts[index].productId);
                              },
                              child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,size: 30,
                                ),
                              
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        ));
                  },
                  itemCount: controller.cartProducts.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 14,
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  width: 120.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: CustomButton2(
                      "Checkout",
                      () {
                        Get.to(() => CheckoutView());
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
