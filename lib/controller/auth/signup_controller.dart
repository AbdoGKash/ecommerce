import 'package:ecommerce/core/class/Staterequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/functions/handlingdata.dart';

abstract class SignUPController extends GetxController {
  signUp();
  goToSingIn();
}

class SignUPControllerImp extends SignUPController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController username;
  // data
  SignUpData signUpData = SignUpData(Get.find());
  StateRequest stateRequest = StateRequest.none;
  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      stateRequest = StateRequest.loading;
      update();
      var response = await signUpData.postData(
          username.text, email.text, phone.text, password.text);
      stateRequest = handlingData(response);
      if (StateRequest.success == stateRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(AppRoute.verifyCodeSignUP, arguments: {
            "email": email.text
          }); // ببعت الايميل للصفحه اللي هروحها
        } else {
          stateRequest = StateRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSingIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
