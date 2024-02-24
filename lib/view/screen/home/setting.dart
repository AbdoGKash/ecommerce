// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/controller/home/setting_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controller = Get.put(SettingControllerImp());
    return ListView(
      children: [
        Stack(
          alignment: Alignment.center, // مهم
          clipBehavior: Clip
              .none, // لمنه اختفاء الاشياء الاخري اللي ف الاستاك لو خدت حجم اكبر
          children: [
            Container(
              height: 150,
              decoration: const BoxDecoration(
                  color: AppColor.primaryColor2,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40))),
            ),
            Positioned(
                top: 100,
                child: Container(
                  // alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  // padding: EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: const CircleAvatar(
                    radius: 150,
                    backgroundImage: AssetImage(AppImageAsset.logoProfile),
                    backgroundColor: AppColor.whiteGary,
                  ),
                )),
          ],
        ),
        SizedBox(
          height: 80,
        ),
        ListTile(
          title: Text("Disable notfacation".tr),
          trailing: Switch(
              activeColor: AppColor.primaryColor,
              value: true,
              onChanged: (val) {}),
        ),
        ListTile(
          title: Text("Change language".tr),
          trailing: Icon(
            Icons.language,
            color: AppColor.primaryColor2,
          ),
          onTap: () {
            controller.goToChangLang();
          },
        ),
        ListTile(
          title: Text("Logout".tr),
          trailing: Icon(
            Icons.exit_to_app,
            color: AppColor.primaryColor2,
          ),
          onTap: () {
            Get.defaultDialog(
              title: "warning".tr,
              middleText: "? Do you want to logout".tr,
              buttonColor: AppColor.primaryColor,
              textCancel: "No".tr,
              textConfirm: "Yes".tr,
              onCancel: () {
                Get.back();
              },
              onConfirm: () {
                controller.logout();
              },
            );
          },
        ),
      ],
    );
  }
}
