import 'package:flutter/material.dart';
import 'package:hydromart/model/user_model.dart';
import 'package:hydromart/services/flutter_user.dart';
import 'package:hydromart/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../services/local_storage.dart';

class AuthViewController extends GetxController {
  String? email, password, name;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Rxn<User>? _user = Rxn<User>();

  String? get user => _user?.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user?.bindStream(_auth.authStateChanges());
  }



  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) {
        FireStoreUser().getUserFromFirestore(value.user!.uid).then((doc) {
          saveUserLocal(
              UserModel.fromJson(doc.data() as Map<dynamic, dynamic>));
        });
      });
      Get.offAll(() => ControlView());
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

  void registerWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        await FireStoreUser().addUserToFireStore(UserModel(
          userId: user.user!.uid,
          email: user.user!.email!,
          name: name!,
          pic: '',
        ));
        saveUserLocal(UserModel(
          userId: user.user!.uid,
          email: user.user!.email!,
          name: name!,
          pic: '',
        ));
      });
      Get.offAll(() => ControlView());
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

  void signOut() async {
    try {
      await _auth.signOut();
      LocalStorageUser.clearUserData();
    } catch (error) {
      print(error);
    }
  }

  void saveUserLocal(UserModel userModel) async {
    LocalStorageUser.setUserData(userModel);
  }
}
