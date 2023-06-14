import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydromart/view/detail_view.dart';
import 'package:hydromart/view/themes/appbartheme.dart';
import 'package:hydromart/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_view_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2("Hydro mart"),
      body: GetBuilder<HomeViewController>(
        init: Get.put(HomeViewController()),
        builder: (controller) => SingleChildScrollView(
          // padding: const EdgeInsets.all(20),
          child: Center(
            child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 20,
                runSpacing: 20,
                children: controller.products
                    .map(
                      (index) => GestureDetector(
                        onTap: () {
                          Get.to(() => DetailView(model: index));
                        },
                        child: Container(
                          height: 220.h,
                          width: 150.h,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(163, 158, 158, 158)),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  index.image,
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText2(
                                text: index.name.toUpperCase(),
                                fontSize: 16,
                              ),
                              CustomText(
                                text: index.more.toLowerCase(),
                                fontSize: 12,
                                color: Colors.black,
                                maxLines: 1,
                              ),
                              const Spacer(),
                              CustomText2(
                                text: 'RP. ${index.price}',
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList()),
          ),
        ),
      ),
    );
  }
}

class ListViewProducts extends StatelessWidget {
  const ListViewProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
