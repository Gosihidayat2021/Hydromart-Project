import 'package:hydromart/controller/cart_view_controller.dart';
import 'package:hydromart/model/cart_model.dart';
import 'package:hydromart/model/products_model.dart';
import 'package:hydromart/view/themes/appbartheme.dart';
import 'package:hydromart/view/widget/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import './widget/custom_text.dart';

class DetailView extends StatelessWidget {
  ProductModel model;
  DetailView({required this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('DETAIL PRODUK'),
      // bottomNavigationBar: CustomBottomNavigationBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1,color: Colors.black12)
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Image.network(
                          model.image,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomText2(
                      text: model.name,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const CustomText(
                      text: "Deskripsi :",
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CustomText(
                        text: model.description,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText2(
                                text: 'Rp. ${model.price}/',
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                          CustomText(
                                text: model.more,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                        ],
                      ),
                    ),
                   ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<CartViewController>(
                        init: CartViewController(),
                        builder: (controller) => Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CustomButton2("Tambahkan", () {
                              controller.addProduct(CartModel(
                                name: model.name,
                                image: model.image,
                                price: model.price,
                                more: model.more,
                                productId: model.productId,
                              ));
                            }),
                          ),
                        ),
                      ),
          )

        ],
      ),
    );
  }
}
