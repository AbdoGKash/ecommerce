import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/datasource/static/static.dart';

abstract class OnBoradingController extends GetxController {
  onPageChanged(int index);
  next();
}

class OnBoradingControllerImp extends OnBoradingController {
  // A controller for [PageView] and class PageController extends ScrollController
  //pageview  لل controller  يجب اضافه ال
  late PageController pageController;
  int currentPage = 0;
  MyServices myServices = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage > onBoradingList.length - 1) {
      myServices.sharedPreferences.setString("step",
          "1"); // دلوقتي لما يوصل لاخر صفحه ف الاون بوردنج هيتخزن ده ف الشيرد
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    //LateInitializationError: Field 'pageController' has not been initialized. لازم تعيين قيمه عشان الخطا ده
    pageController = PageController();
    super.onInit();
  }
}
