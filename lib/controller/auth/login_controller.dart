// ignore_for_file: avoid_print, unused_local_variable

import 'package:ecommerce/core/class/Staterequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../core/functions/handlingdata.dart';

abstract class LoginController extends GetxController {
  login();
  goToSingUp();
  goToForgetPassword();
  // loginFirebase();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  // List data = [];
  bool isShowPassword = true;
  StateRequest stateRequest = StateRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();

  showPassword() {
    // if (isShowPassword == false) {
    //   isShowPassword = true;
    // } else {
    //   isShowPassword = false;
    // }
    // update(); // to refresh ui
    // //OR
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  goToSingUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      stateRequest = StateRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      stateRequest = handlingData(response);
      if (StateRequest.success == stateRequest) {
        if (response['status'] == 'success') {
          //data.addAll(response['data']);
          // هنجيب بعض بيانات المستخدم ونخزنها ف الشيرد لاننا هنحتجها داخل الاب
          //"${response['data']['users_id']}"  ""شايف دي طلعت عيني عشان انا كونت عاملها بدون
          myServices.sharedPreferences
              .setString("id", "${response['data']['users_id']}");
          myServices.sharedPreferences
              .setString("username", "${response['data']['users_name']}");
          myServices.sharedPreferences
              .setString("email", "${response['data']['users_email']}");
          myServices.sharedPreferences
              .setString("phone", "${response['data']['users_phone']}");
          myServices.sharedPreferences.setString(
              "step", "2"); // عشان الميدل وير ولما يسجل يدخل علطول بعد كدا
          Get.offAllNamed(AppRoute.homeScreen);
        } else {
          Get.defaultDialog(
            title: "warning".tr,
            middleText: "Email or Password not correct".tr,
          );
          stateRequest = StateRequest.failure;
        }
        update();
      }
    }
  }

  @override
  void onInit() {
    // Token
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

// // Auth Firebase
//   @override
//   loginFirebase() async {
//     try {
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email.text,
//         password: password.text,
//       );
//       Get.offAllNamed(AppRoute.homeScreen);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
}
