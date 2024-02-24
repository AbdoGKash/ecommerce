import 'package:ecommerce/controller/home/myfavorite_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../widget/myfavorite/customlistmyfavorite.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColor.white),
          backgroundColor: AppColor.primaryColor2,
          title: Text(
            "Favorite".tr,
            style: const TextStyle(
                color: AppColor.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: GetBuilder<MyFavoriteControllerImp>(
            builder: (controller) => Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      HandlingDataView(
                          stateRequest: controller.stateRequest!,
                          widget: GridView.builder(
                              itemCount: controller.data.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.5),
                              itemBuilder: (context, index) {
                                return CustomListMyFavorite(
                                    myFavoriteModel: controller.data[index]);
                              }))
                    ],
                  ),
                )));
  }
}
