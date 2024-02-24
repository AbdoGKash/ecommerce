import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/Staterequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/model/itemsmodel.dart';

abstract class CartController extends GetxController {
  addCart(String itemsId);
  removeCart(String itemsId);
  initialData();
  sumprice();
  goToCheckOut();
}

class CartControllerImp extends CartController {
  late ItemsModel itemsModel;
  CartData cartData = CartData(Get.find());
  StateRequest? stateRequest;
  MyServices myServices = Get.find();
  double delivery = 60.0;
  late double totalPrice;
  @override
  addCart(itemsId) async {
    stateRequest = StateRequest.loading;
    update();
    var response = await cartData.addData(
        myServices.sharedPreferences.getString("id")!, itemsId);
    stateRequest = handlingData(response);
    if (StateRequest.success == stateRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "notifications",
            backgroundColor: AppColor.gary,
            borderColor: AppColor.primaryColor,
            messageText: const Text("The product has been added to cart"));
        // data.addAll(response['data']);
      } else {
        stateRequest = StateRequest.failure;
      }
    }
    // update();
  }

  @override
  removeCart(itemsId) async {
    // data.clear();
    stateRequest = StateRequest.loading;
    update();
    var response = await cartData.removeData(
        myServices.sharedPreferences.getString("id")!, itemsId);
    stateRequest = handlingData(response);
    if (StateRequest.success == stateRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "notifications",
            backgroundColor: AppColor.gary,
            borderColor: AppColor.primaryColor,
            messageText:
                const Text("The product has been removed from favorites"));
        // data.addAll(response['data']);
      } else {
        stateRequest = StateRequest.failure;
      }
    }
    // update();
  }

  @override
  sumprice() {
    totalPrice = itemsModel.itemsPrice!.toDouble() + delivery;
  }

  @override
  initialData() {
    itemsModel = Get.arguments['itemsModel'];
  }

  @override
  void onInit() {
    initialData();
    sumprice();
    super.onInit();
  }

  @override
  goToCheckOut() {
    Get.toNamed(AppRoute.checkOut);
  }
}
