import 'package:ecommerce/controller/onborading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBorading extends GetView<OnBoradingControllerImp> {
  const CustomSliderOnBorading({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        // number page 0 , 1 , 2 , 3
        onPageChanged: (value) {
          // Getx
          controller.onPageChanged(value);
        },
        itemCount: onBoradingList.length,
        itemBuilder: (context, index) => Column(
              children: [
                Image.asset(onBoradingList[index].image,
                    height: Get.width / 1.2),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  onBoradingList[index].titel,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  onBoradingList[index].body,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColor.gary),
                )
              ],
            ));
  }
}
