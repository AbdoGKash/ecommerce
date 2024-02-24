// ignore_for_file: unused_local_variable

import 'package:ecommerce/data/datasource/remote/myfavorite_data.dart';
import 'package:ecommerce/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/Staterequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';

abstract class MyFavoriteController extends GetxController {
  getData();
  removeData(String favoriteId);
}

class MyFavoriteControllerImp extends MyFavoriteController {
  MyServices myServices = Get.find();
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  StateRequest? stateRequest;
  List<MyFavoriteModel> data = [];

  @override
  getData() async {
    data.clear();
    stateRequest = StateRequest.loading;
    update();
    var response = await myFavoriteData
        .postData(myServices.sharedPreferences.getString("id")!);
    stateRequest = handlingData(response);
    if (StateRequest.success == stateRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        stateRequest = StateRequest.failure;
      }
    }
    update();
  }

  @override
  removeData(favoriteId) {
    var response = myFavoriteData.remove(favoriteId);
    data.removeWhere((element) => element.favoriteId.toString() == favoriteId);
    update();
    Get.rawSnackbar(
        animationDuration: Durations.extralong1,
        title: "notifications".tr,
        backgroundColor: AppColor.primaryColor2,
        borderColor: AppColor.primaryColor2,
        duration: const Duration(seconds: 1),
        messageText: Text("The product has been removed from favorites".tr));
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
