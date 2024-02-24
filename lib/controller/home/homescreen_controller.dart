import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/screen/home/home.dart';
import 'package:ecommerce/view/screen/home/about.dart';
import 'package:ecommerce/view/screen/home/search.dart';
import 'package:ecommerce/view/screen/home/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(index);
  goToFavorite();
}

class HomeScreenControllerImp extends HomeScreenController {
  int curentPage = 0;

  List bottomAppBar = [
    {"titel": "home".tr, "icon": Icons.home},
    {"titel": "search".tr, "icon": Icons.search},
    {"titel": "setting".tr, "icon": Icons.settings},
    {"titel": "about".tr, "icon": Icons.info_outline}
  ];

  List<Widget> listPage = [
    const Home(),
    const Search(),
    const Setting(),
    const About()
  ];

  @override
  changePage(index) {
    curentPage = index;
    update();
  }

  @override
  goToFavorite() {
    Get.toNamed(AppRoute.favorite);
    throw UnimplementedError();
  }
}
