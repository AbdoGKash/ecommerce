import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/Staterequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handlingdata.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;

  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  StateRequest stateRequest = StateRequest.none;

  @override
  checkemail() async {
    if (formstate.currentState!.validate()) {
      stateRequest = StateRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      stateRequest = handlingData(response);
      if (StateRequest.success == stateRequest) {
        if (response['status'] == 'success') {
          Get.toNamed(AppRoute.verifyCode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "warning",
              middleText: "Email not Found",
              backgroundColor: AppColor.primaryColor);
          stateRequest = StateRequest.failure;
        }
        update();
      }
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
