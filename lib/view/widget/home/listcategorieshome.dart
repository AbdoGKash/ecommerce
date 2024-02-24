import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../applink.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/categoriesmodel.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
              selectCategories: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? selectCategories;
  const Categories(
      {Key? key, required this.categoriesModel, required this.selectCategories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, selectCategories!,
            categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    "${AppLink.imagecategories}/${categoriesModel.categoriesImage}"),
              ),
            ),
          ),
          const SizedBox(height: 10),
          myServices.sharedPreferences.getString("lang") == "en"
              ? Text(
                  "${categoriesModel.categoriesName}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor),
                )
              : Text(
                  "${categoriesModel.categoriesNameAr}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor),
                )
        ],
      ),
    );
  }
}
