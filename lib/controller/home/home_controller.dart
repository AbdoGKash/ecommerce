import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/Staterequest.dart';
import '../../core/functions/handlingdata.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  goToItems(List categories, int selectCategories, String categoriesId);
  searchData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? id;
  HomeData homeData = HomeData(Get.find());
  StateRequest? stateRequest;
  // List data = [];
  List categories = [];
  List items = [];

  // start =========================== search =================== //
  TextEditingController? search;
  bool isSearch = false;
  List<ItemsModel> listData = [];
  checkSearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  @override
  searchData() async {
    stateRequest = StateRequest.loading;
    update();
    var response = await homeData.searchData(search!.text);
    stateRequest = handlingData(response);
    if (StateRequest.success == stateRequest) {
      if (response['status'] == 'success') {
        listData.clear(); // عشان كل مره ابحث يعرض البيانات الجديده والقديمه
        List responseData = response['data'];
        listData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        stateRequest = StateRequest.failure;
      }
    }
    update();
  }

  // end =========================== search =================== //
  @override
  initialData() {
    // username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    getData(); // عشان الداتا تيجي اول لما ندخل الهوم
    initialData();
    search = TextEditingController();
    super.onInit();
  }

  @override
  getData() async {
    stateRequest = StateRequest.loading;
    update();
    var response = await homeData.postData();
    stateRequest = handlingData(response);
    if (StateRequest.success == stateRequest) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        stateRequest = StateRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectCategories, categoriesId) {
    // categories and  selectCategories pass to item page
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectCategories": selectCategories,
      "categoriesid": categoriesId
    });
  }
}
