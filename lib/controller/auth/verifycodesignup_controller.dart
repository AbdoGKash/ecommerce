// ignore_for_file: avoid_print

import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycode.dart';
import 'package:get/get.dart';

import '../../core/class/Staterequest.dart';

abstract class VerfiyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verifycodesignup);
}

class VerfiyCodeSignUpControllerImp extends VerfiyCodeSignUpController {
  String? email;
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  StateRequest stateRequest = StateRequest.none;
  @override
  goToSuccessSignUp(verifycodesignup) async {
    stateRequest = StateRequest.loading;
    update();
    var response = await verifyCodeData.postData(email!, verifycodesignup);
    stateRequest = handlingData(response);
    if (StateRequest.success == stateRequest) {
      if (response['status'] == 'success') {
        Get.toNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "warning".tr,
            middleText: "VerifyCode not correct".tr,
            backgroundColor: AppColor.primaryColor);
        stateRequest = StateRequest.failure;
      }
      update();
    }
  }

  @override
  checkCode() {}

  @override
  void onInit() {
    email =
        Get.arguments['email']; // بستقبل الايميل اللي انا بعته من صفحه السين اب
    super.onInit();
  }
}
