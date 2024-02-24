// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/controller/home/cart_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/cart/pricedetils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../applink.dart';
import '../../../core/services/services.dart';
import '../../widget/cart/custombottom.dart';
import '../../widget/cart/customcard.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    CartControllerImp controller = Get.put(CartControllerImp());
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColor.white),
          backgroundColor: AppColor.primaryColor2,
          title: Text(
            "My Cart".tr,
            style:
                TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Price(
                label: "Price".tr,
                price: "${controller.itemsModel.itemsPrice}"),
            Price(label: "delivery".tr, price: "${controller.delivery}"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                color: AppColor.darkgray,
              ),
            ),
            Price(
              label: "Total Price".tr,
              price: "${controller.totalPrice}",
              color: AppColor.primaryColor2,
            ),
            SizedBox(
              width: Get.width,
              child: CustomBottomCart(
                text: 'Order'.tr,
                onPressed: () {
                  controller.goToCheckOut();
                },
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              myServices.sharedPreferences.getString("lang") == "en"
                  ? CoustomCard(
                      name: '${controller.itemsModel.itemsName}',
                      count: '3',
                      image:
                          "${AppLink.imageitems}/${controller.itemsModel.itemsImage!}",
                    )
                  : CoustomCard(
                      name: '${controller.itemsModel.itemsNameAr}',
                      count: '3',
                      image:
                          "${AppLink.imageitems}/${controller.itemsModel.itemsImage!}",
                    )
            ],
          ),
        ));
  }
}
