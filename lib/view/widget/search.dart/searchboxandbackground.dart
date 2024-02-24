import 'package:ecommerce/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import 'customappbar.dart';

class SearchBoxAndBackground extends GetView<HomeControllerImp> {
  const SearchBoxAndBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: Get.width,
          decoration: const BoxDecoration(
              color: AppColor.primaryColor2,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(35))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Text(
                  "Search".tr,
                  style: const TextStyle(
                    color: AppColor.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomAppBar(
                  titleappbar: 'Find Your Product'.tr,
                  onPressedSearch: () {
                    controller.onSearchItems();
                  },
                  mycontroller: controller.search!,
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
