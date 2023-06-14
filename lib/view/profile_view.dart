import 'package:hydromart/view/edit_profile_view.dart';
import 'package:hydromart/view/themes/appbartheme.dart';
import 'package:hydromart/view/welcomeview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/profile_view_controller.dart';
import './widget/custom_text.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewController>(
      init: ProfileViewController(),
      builder: (controller) => controller.loading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              appBar: CustomAppBar2('MY PROFILE'),
              body: Padding(
                padding: EdgeInsets.only(top: 16.h, right: 16.w, left: 16.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  image: (controller.currentUser!.pic != "")
                                      ? DecorationImage(
                                          image: NetworkImage(
                                              controller.currentUser!.pic),
                                          fit: BoxFit.cover)
                                      : const DecorationImage(
                                          image:
                                              AssetImage('assets/profil.png'),
                                          fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: controller.currentUser!.name,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  maxLines: 1,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: controller.currentUser!.email,
                                  fontSize: 15,
                                  maxLines: 1,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      ListTile(
                        leading: Image.asset('assets/icons/1.png'),
                        title: const CustomText(
                          text: "Edit Profile",
                        ),
                        onTap: () {
                          Get.to(() => EditProfileView());
                        },
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ListTile(
                        leading: Image.asset('assets/icons/2.png'),
                        title: const CustomText(
                          text: "Log Out",
                        ),
                        onTap: () {
                          controller.signOut();
                          Get.to(() => WelcomeView());
                        },
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
