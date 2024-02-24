import 'package:ecommerce/controller/home/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key});

  @override
  Widget build(BuildContext context) {
    CompleteCheckoutController controller =
        Get.put(CompleteCheckoutController());
    return Container(
      margin: const EdgeInsets.all(20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          controller.goToCompleteCheckout();
        },
        color: AppColor.primaryColor2,
        child: Text(
          "Complete Checkout".tr,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: AppColor.white),
        ),
      ),
    );
  }
}
