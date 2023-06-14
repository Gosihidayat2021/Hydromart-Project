import 'package:flutter/material.dart';
import 'package:hydromart/view/welcomeview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../services/flutter_user.dart';
import '../services/local_storage.dart';
import '../../model/user_model.dart';

class ProfileViewController extends GetxController {
  UserModel? _currentUser;
  String? name, email, password, picUrl;

  UserModel? get currentUser => _currentUser;

  bool _loading = false;

  bool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  getTest() async {
    await FireStoreUser()
        .getUserFromFirestore('m7sWK9ZcIJR8jfdArTMExILx4qF2')
        .then((doc) {
      print(doc.data() as Map<dynamic, dynamic>);
      saveUserLocal(UserModel.fromJson(doc.data() as Map<dynamic, dynamic>));
    });
  }

  getCurrentUser() async {
    _loading = true;
    _currentUser = await LocalStorageUser.getUserData();
    _loading = false;
    update();
  }

  updateCurrentUser() async {
    try {
      UserModel userModel = UserModel(
        userId: _currentUser!.userId,
        email: email!,
        name: name!,
        pic: picUrl == null ? _currentUser!.pic : picUrl!,
      );
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) {
        FireStoreUser().getUserFromFirestore(value.user!.uid).then((doc) {
          saveUserLocal(
              UserModel.fromJson(doc.data() as Map<dynamic, dynamic>));
        });
      });
      await FirebaseAuth.instance.currentUser!.updateEmail(email!);
      await FirebaseAuth.instance.currentUser!.updatePassword(password!);
      FireStoreUser().addUserToFireStore(userModel);
      await LocalStorageUser.setUserData(userModel);
      getCurrentUser();
      Get.back();
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
  Get.snackbar('FAILED',errorMessage,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 1),
    backgroundColor: Colors.red.withOpacity(0.7),
    overlayColor: Colors.transparent,
    colorText: Colors.white,
    margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
    icon: const Icon(Icons.not_interested_rounded,color: Colors.white,size: 30,),
    borderRadius: 20,
    barBlur: 0);
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // final LocalStorageUser localStorageUser = Get.find();

  void signOut() async {
    try {
      await _auth.signOut();
      LocalStorageUser.clearUserData();
      Get.to(() => WelcomeView());
    } catch (error) {
      print(error);
    }
  }

  void saveUserLocal(UserModel userModel) async {
    await LocalStorageUser.setUserData(userModel);
  }
}
