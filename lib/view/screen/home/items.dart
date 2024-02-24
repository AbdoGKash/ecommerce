// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:ecommerce/controller/home/favorite_controller.dart';
import 'package:ecommerce/controller/home/items_controller.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/items/customlistitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../widget/items/listcategoriesitems.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColor.white),
          backgroundColor: AppColor.primaryColor2,
          title: Text(
            "Items".tr,
            style:
                TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              // CustomAppBar(
              //   titleappbar: 'Find product',
              //   onPressedIconFavorite: () {
              //     Get.toNamed(AppRoute.favorite);
              //   },
              // ),
              const SizedBox(
                height: 10,
              ),
              const ListCategoriesItems(),
              GetBuilder<ItemsControllerImp>(
                  builder: (controller) => HandlingDataView(
                      stateRequest: controller.stateRequest!,
                      widget: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      0.5), // or mainAxisExtent: 300
                          itemBuilder: (context, index) {
                            controllerFav.isFavorite[controller.data[index]
                                    ["items_id"]] =
                                controller.data[index]['favorite'];
                            return CustomListItems(
                                // active: false,
                                itemsModel: ItemsModel.fromJson(controller.data[
                                    index])); // لازم ليست عشان كدا هجيب الجريد فيو هنا
                          })))
            ],
          ),
        ));
  }
}
