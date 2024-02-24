// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteCheckout extends StatelessWidget {
  const CompleteCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Payment completed successfully".tr,
            style: TextStyle(
                color: AppColor.primaryColor2,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Center(child: Image.asset(AppImageAsset.done)),
          Container(
            margin: const EdgeInsets.all(20),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Get.offAllNamed(AppRoute.home);
              },
              color: AppColor.primaryColor2,
              child: Text(
                "Go to home".tr,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColor.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
