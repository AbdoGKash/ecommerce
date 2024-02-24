import 'package:ecommerce/controller/home/homescreen_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/functions/alertexitapp.dart';
import '../widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.primaryColor2,
                shape: const CircleBorder(),
                onPressed: () {
                  controller.goToFavorite();
                },
                child: const Icon(
                  Icons.favorite_outline,
                  color: AppColor.white,
                )),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomButtomAppBarHome(),
            body: PopScope(
                canPop: false,
                onPopInvoked: (didPop) {
                  alertExitApp();
                },
                child: controller.listPage.elementAt(controller.curentPage))));
  }
}
