// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/controller/home/home_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/home/listcategorieshome.dart';
import '../../widget/home/listitemshome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.white),
        backgroundColor: AppColor.primaryColor2,
        title: Center(
          child: Text(
            "Home".tr,
            style:
                TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<HomeControllerImp>(
          builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: [
                    HandlingDataView(
                        stateRequest: controller.stateRequest!,
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(AppImageAsset.back),
                            // CustomCardHome(
                            //   title: 'A winter suprise\n'.tr,
                            //   body: 'Cashback 25%'.tr,
                            // ),
                            CustomTitleHome(title: "Categories".tr),
                            ListCategoriesHome(),
                            CustomTitleHome(title: "Prodect for you".tr),
                            ListItemsHome()
                          ],
                        ))
                  ],
                ),
              ) /////////////

          ),
    );
  }
}
