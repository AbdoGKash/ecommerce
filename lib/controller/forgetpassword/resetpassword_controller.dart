// ignore_for_file: avoid_print

import 'package:ecommerce/core/class/Staterequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/functions/handlingdata.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController rePassword;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StateRequest stateRequest = StateRequest.none;
  String? email;

  @override
  resetPassword() async {
    if (password.text != rePassword.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "password does not match");
    }
    if (formstate.currentState!.validate()) {
      stateRequest = StateRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      stateRequest = handlingData(response);
      if (StateRequest.success == stateRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(AppRoute.successResetPassword);
        } else {
          Get.defaultDialog(
              title: "warning",
              middleText: "Something went wrong",
              backgroundColor: AppColor.primaryColor);
          stateRequest = StateRequest.failure;
        }
        update();
      }
    } else {}
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
