// ignore_for_file: unnecessary_overrides

import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/verifycodereset.dart';
import 'package:get/get.dart';

import '../../core/class/Staterequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handlingdata.dart';

abstract class VerfiyCodeController extends GetxController {
  checkCode(String verifycode);
}

class VerfiyCodeControllerImp extends VerfiyCodeController {
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
  StateRequest stateRequest = StateRequest.none;
  String? email;

  @override
  checkCode(verifycode) async {
    stateRequest = StateRequest.loading;
    update();
    var response =
        await verifyCodeForgetPasswordData.postData(email!, verifycode);
    stateRequest = handlingData(response);
    if (StateRequest.success == stateRequest) {
      if (response['status'] == 'success') {
        Get.toNamed(AppRoute.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "warning",
            middleText: "verifycode not correct",
            backgroundColor: AppColor.primaryColor);
        stateRequest = StateRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
