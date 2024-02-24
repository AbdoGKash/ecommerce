// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/productdatils_controller.dart';
import '../../../core/services/services.dart';
import '../../widget/product/custombottom.dart';
import '../../widget/product/customtextproduct.dart';
import '../../widget/product/priceandcount.dart';
import '../../widget/product/productandbackground.dart';

class ProductDatils extends StatelessWidget {
  const ProductDatils({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    ProductDatilsControllerImp controller =
        Get.put(ProductDatilsControllerImp());
    // CartControllerImp cartController = Get.put(CartControllerImp());
    return Scaffold(
      bottomNavigationBar: CustomBottom(
        text: "Add To Cart".tr,
        onPressed: () {
          controller.goToCart();
        },
      ),
      body: ListView(
        children: [
          ProductAndBackground(),
          SizedBox(
            height: 90,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myServices.sharedPreferences.getString("lang") == "en"
                    ? CustomTextProduct(
                        text: "${controller.itemsModel.itemsName}",
                      )
                    : CustomTextProduct(
                        text: "${controller.itemsModel.itemsNameAr}",
                      ),
                PriceAndCount(
                  // onAdd: () {
                  //   controller.cartController
                  //       .addCart(controller.itemsModel.itemsId.toString());
                  // },
                  // onRemove: () {
                  //   controller.cartController
                  //       .removeCart(controller.itemsModel.itemsId.toString());
                  // },
                  price: "${controller.itemsModel.itemsPrice}",
                  count: '2',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${controller.itemsModel.itemsDescription}",
                  style: TextStyle(
                    height: 1,
                    fontFamily: "",
                    color: AppColor.homeColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // CustomTextProduct(
                //   text: "Color",
                // ),
                // ColorAndActive()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
