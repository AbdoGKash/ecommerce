import 'package:ecommerce/core/constant/app_theme.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish; // قيمه ابتدائيه
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar"
        ? themeArabic
        : themeEnglish; // تغيير الثيم بناء علي اللغه
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    if (myServices.sharedPreferences.getString("lang") == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic; //vedio 21
    } else if (myServices.sharedPreferences.getString("lang") == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
