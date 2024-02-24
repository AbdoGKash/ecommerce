// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home/favorite_controller.dart';
import 'package:ecommerce/controller/home/items_controller.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../applink.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/services.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItems({
    super.key,
    required this.itemsModel,
    // required this.active,
  });

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return InkWell(
      onTap: () {
        controller.goToProductDatils(itemsModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              Hero(
                tag:
                    "${itemsModel.itemsId}", //لازم تاخد رقم ثابت ووميز عشان ف المكان التاني اللي هتظهر فيه الصوره تاخد نفس الرقم
                child: CachedNetworkImage(
                  imageUrl: '${AppLink.imageitems}/${itemsModel.itemsImage}',
                ),
              ),
              myServices.sharedPreferences.getString("lang") == "en"
                  ? Text(
                      '${itemsModel.itemsName}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  : Text(
                      '${itemsModel.itemsNameAr}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Rating".tr,
                        style: TextStyle(color: AppColor.darkgray),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ...List.generate(
                        3,
                        (index) => Icon(
                              Icons.star,
                              color: AppColor.primaryColor2,
                              size: 15,
                            ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${itemsModel.itemsPrice} \$",
                      style: TextStyle(
                          fontFamily: "snsn",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor2)),
                  GetBuilder<FavoriteControllerImp>(
                    builder: (controller) => IconButton(
                      onPressed: () {
                        if (controller.isFavorite[itemsModel.itemsId] == 1) {
                          controller
                              .removeFavorite(itemsModel.itemsId!.toString());
                          controller.setFavorite(itemsModel.itemsId, 0);
                        } else {
                          // == 0
                          controller
                              .addFavorite(itemsModel.itemsId!.toString());
                          controller.setFavorite(itemsModel.itemsId, 1);
                        }
                      },
                      icon: Icon(
                        controller.isFavorite[itemsModel.itemsId] == 1
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: AppColor.primaryColor2,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
