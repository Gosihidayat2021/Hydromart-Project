import 'package:hydromart/view/themes/appbartheme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hydromart/view/themes/color.dart';

import '../controller/selectImgae_controller.dart';
import '../controller/profile_view_controller.dart';
import './widget/custom_text.dart';
import './widget/custom_buttom.dart';
import './widget/text_form_field.dart';

class EditProfileView extends StatefulWidget {
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    String loginMethod =
        FirebaseAuth.instance.currentUser!.providerData[0].providerId;
    final ProfileViewController userProfile = Get.find<ProfileViewController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar('Edit Profile'),
      // bottomNavigationBar: CustomBottomNavigationBar(),
      body: Center(
        child: GetBuilder<SelectImageViewModel>(
          init: SelectImageViewModel(),
          builder: (controller) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 24.h),
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            (userProfile.currentUser!.pic=='')?
                            CircleAvatar(
                              radius: 60.h,
                              backgroundImage: const AssetImage('assets/profil.png'),
                              foregroundImage: controller.imageFile != null
                                  ? FileImage(controller.imageFile!)
                                  : null,
                            ):CircleAvatar(
                              radius: 60.h,
                              backgroundImage: NetworkImage(userProfile.currentUser!.pic),
                              foregroundImage: controller.imageFile != null
                                  ? FileImage(controller.imageFile!)
                                  : null,
                            ),
                            SizedBox(
                              width: 40.w,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.dialog(
                                  AlertDialog(
                                    title: CustomText(
                                      text: 'Choose option',
                                      fontSize: 20,
                                      color: primaryColor,
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Divider(
                                          height: 1.h,
                                        ),
                                        ListTile(
                                          onTap: () async {
                                            try {
                                              await controller.cameraImage();
                                              Get.back();
                                            } catch (error) {
                                              Get.back();
                                            }
                                          },
                                          title: const CustomText(
                                            text: 'Camera',
                                          ),
                                          leading: Icon(
                                            Icons.camera,
                                            color: primaryColor,
                                          ),
                                        ),
                                        Divider(
                                          height: 1.h,
                                        ),
                                        ListTile(
                                          onTap: () async {
                                            try {
                                              await controller.galleryImage();
                                              Get.back();
                                            } catch (error) {
                                              Get.back();
                                            }
                                          },
                                          title: const CustomText(
                                            text: 'Gallery',
                                          ),
                                          leading: Icon(
                                            Icons.account_box,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Select Image'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                        CustomTextFormField2(
                          title: 'Name',
                          hintText: Get.find<ProfileViewController>()
                              .currentUser!
                              .name,
                          initialValue: Get.find<ProfileViewController>()
                              .currentUser!
                              .name,
                          validatorFn: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please enter valid name.';
                            }
                            return null;
                          },
                          onSavedFn: (value) {
                            Get.find<ProfileViewController>().name = value;
                          },
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                        Column(
                          children: [
                            CustomTextFormField2(
                              title: 'Email',
                              hintText: Get.find<ProfileViewController>()
                                  .currentUser!
                                  .email,
                              initialValue: Get.find<ProfileViewController>()
                                  .currentUser!
                                  .email,
                              keyboardType: TextInputType.emailAddress,
                              validatorFn: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter valid email address.';
                                }
                                return null;
                              },
                              onSavedFn: (value) {
                                Get.find<ProfileViewController>().email = value;
                              },
                            ),
                            SizedBox(
                              height: 38.h,
                            ),
                            CustomTextFormField2(
                              title: 'Password',
                              hintText: '',
                              obscureText: true,
                              validatorFn: (value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return 'Please enter valid password with at least 6 characters.';
                                }
                                return null;
                              },
                              onSavedFn: (value) {
                                Get.find<ProfileViewController>().password =
                                    value;
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        _isLoading
                            ? const CircularProgressIndicator()
                            : Padding(
                              padding: const EdgeInsets.symmetric(horizontal:30),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CustomButton2(
                                    'SUBMIT',
                                    () async {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          _isLoading = true;
                                        });
                                        try {
                                          await controller.uploadImageToFirebase();
                                          Get.find<ProfileViewController>().picUrl =
                                              controller.picUrl;
                                        } catch (e) {
                                          Get.find<ProfileViewController>().picUrl =
                                              Get.find<ProfileViewController>()
                                                  .currentUser!
                                                  .pic;
                                        }
                                        _formKey.currentState!.save();
                                        await Get.find<ProfileViewController>()
                                            .updateCurrentUser();
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      }
                                    },
                                  ),
                              ),
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
