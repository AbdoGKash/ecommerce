import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      //2=> login
      return const RouteSettings(name: AppRoute.homeScreen);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      //1=> onbording
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
