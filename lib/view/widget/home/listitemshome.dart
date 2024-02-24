import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../applink.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/itemsmodel.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[index]));
          }),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Stack(children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin: const EdgeInsets.only(right: 10, left: 10),
        height: 100,
        width: 180,
        child: Image.network(
          "${AppLink.imageitems}/${itemsModel.itemsImage}",
          fit: BoxFit.fitHeight,
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: AppColor.gary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20)),
        height: 100,
        width: 180,
      ),
      Positioned(
          top: 3,
          left:
              myServices.sharedPreferences.getString("lang") == "en" ? 8 : null,
          right: myServices.sharedPreferences.getString("lang") == "ar"
              ? 10
              : null,
          child: myServices.sharedPreferences.getString("lang") == "en"
              ? Text(
                  "${itemsModel.itemsName}",
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                )
              : Text(
                  "${itemsModel.itemsNameAr}",
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ))
    ]);
  }
}
