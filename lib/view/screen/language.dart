import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Choose Language".tr,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            CustomButtonLanguage(
                textButton: "Arabic".tr,
                onPressed: () {
                  controller.changeLang("ar");
                  Get.toNamed(AppRoute.onBoarding);
                }),
            CustomButtonLanguage(
                textButton: "English".tr,
                onPressed: () {
                  controller.changeLang("en");
                  Get.toNamed(AppRoute.onBoarding);
                })
          ],
        ),
      ),
    );
  }
}
