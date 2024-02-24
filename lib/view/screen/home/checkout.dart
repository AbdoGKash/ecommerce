// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/view/widget/checkout/customText.dart';
import 'package:ecommerce/view/widget/checkout/custombottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/checkout/customtextfield.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColor.white),
          backgroundColor: AppColor.primaryColor2,
          title: Text(
            "Checkout".tr,
            style:
                TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                "Choose Payment Method".tr,
                style: TextStyle(
                    color: AppColor.primaryColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 30,
                  width: 300,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor2,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Payment Card".tr,
                        style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(AppImageAsset.payment)
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 30,
                  width: 300,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor3,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Cash".tr,
                      style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "Enter name card".tr),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                    hintText: 'name on cart'.tr,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(text: "Enter card number".tr),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                    hintText: 'card number'.tr,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(text: "Enter address".tr),
              SizedBox(
                height: 10,
              ),
              CustomTextFiled(
                hintText: 'address'.tr,
              ),
              CustomBottom()
            ],
          ),
        ));
  }
}
