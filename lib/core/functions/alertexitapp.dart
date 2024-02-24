import 'dart:io';

import 'package:ecommerce/core/constant/color.dart';
import 'package:get/get.dart';

alertExitApp() {
  return Get.defaultDialog(
    title: "warning".tr,
    middleText: "? Do you want to exit the application".tr,
    buttonColor: AppColor.primaryColor,
    textCancel: "No".tr,
    textConfirm: "Yes".tr,
    onCancel: () {
      Get.back();
    },
    onConfirm: () {
      exit(0);
    },
  );
}
