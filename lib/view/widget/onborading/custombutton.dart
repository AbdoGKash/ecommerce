import 'package:ecommerce/controller/onborading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

// GetView عشان مش هيحصل ريفرش علي ال ui
class CustomButtonOnBording extends GetView<OnBoradingControllerImp> {
  const CustomButtonOnBording({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: MaterialButton(
        height: 40,
        minWidth: 280,
        onPressed: () {
          controller.next();
        },
        color: AppColor.primaryColor,
        child: Text(
          "Continue".tr,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
