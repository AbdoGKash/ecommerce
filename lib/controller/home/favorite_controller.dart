import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/datasource/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/Staterequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';

abstract class FavoriteController extends GetxController {
  setFavorite(id, val);
  addFavorite(String itemsId);
  removeFavorite(String itemsId);
}

class FavoriteControllerImp extends FavoriteController {
  Map isFavorite = {};
  MyServices myServices = Get.find();
  FavoriteData favoriteData = FavoriteData(Get.find());
  StateRequest? stateRequest;
  List data = [];

// عملنا ماب والكي بتاعها هو الاي دي والقيمه بتاعتها هيا صفر اول واحد يعني واحد ف المفضله وصفر مش فيها
  @override
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  @override
  addFavorite(itemsId) async {
    data.clear();
    stateRequest = StateRequest.loading;
    update();
    var response = await favoriteData.addData(
        myServices.sharedPreferences.getString("id")!, itemsId);
    stateRequest = handlingData(response);
    if (StateRequest.success == stateRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "notifications".tr,
            backgroundColor: AppColor.primaryColor2,
            borderColor: AppColor.primaryColor2,
            duration: const Duration(seconds: 1),
            messageText: Text("The product has been added to favorites".tr));
        // data.addAll(response['data']);
      } else {
        stateRequest = StateRequest.failure;
      }
    }
    // update();
  }

  @override
  removeFavorite(itemsId) async {
    data.clear();
    stateRequest = StateRequest.loading;
    update();
    var response = await favoriteData.removeData(
        myServices.sharedPreferences.getString("id")!, itemsId);
    stateRequest = handlingData(response);
    if (StateRequest.success == stateRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "notifications".tr,
            backgroundColor: AppColor.primaryColor2,
            borderColor: AppColor.primaryColor2,
            duration: const Duration(seconds: 1),
            messageText:
                Text("The product has been removed from favorites".tr));
        // data.addAll(response['data']);
      } else {
        stateRequest = StateRequest.failure;
      }
    }
    // update();
  }
}
