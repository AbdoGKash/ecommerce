// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home/myfavorite_controller.dart';
import 'package:ecommerce/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../applink.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/services.dart';

class CustomListMyFavorite extends GetView<MyFavoriteControllerImp> {
  final MyFavoriteModel myFavoriteModel;
  const CustomListMyFavorite({
    super.key,
    required this.myFavoriteModel,
  });

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: '${AppLink.imageitems}/${myFavoriteModel.itemsImage}',
              ),
              myServices.sharedPreferences.getString("lang") == "an"
                  ? Text(
                      '${myFavoriteModel.itemsName}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  : Text(
                      '${myFavoriteModel.itemsNameAr}',
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text("\$ ${myFavoriteModel.itemsPrice.toString()}",
                    style: TextStyle(
                        fontFamily: "",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor2)),
                IconButton(
                    onPressed: () {
                      controller
                          .removeData(myFavoriteModel.favoriteId!.toString());
                      controller.update();
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      color: AppColor.primaryColor,
                    ))
              ])
            ],
          ),
        ),
      ),
    );
  }
}
