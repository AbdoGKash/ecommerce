// ignore_for_file: must_be_immutable
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/core/localization/translations.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'binding/initbinding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  LocalController controller = Get.put(LocalController());
  EcommerceApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslations(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      theme: controller.appTheme,
      initialBinding: InitinalBinding(),
      getPages: routes,
    );
  }
}
