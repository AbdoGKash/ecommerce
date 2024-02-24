import 'package:ecommerce/controller/onborading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomDotControllerOnBorading extends StatelessWidget {
  const CustomDotControllerOnBorading({super.key});

  @override
  Widget build(BuildContext context) {
    // GetBuilder => For Refresh page
    return GetBuilder<OnBoradingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoradingList.length,
                    (index) => AnimatedContainer(
                          duration: const Duration(microseconds: 900),
                          height: 5,
                          width: controller.currentPage == index ? 20 : 5,
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
