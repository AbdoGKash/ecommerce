import 'package:ecommerce/controller/home/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/services.dart';
import '../../../data/model/categoriesmodel.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
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

class Categories extends GetView<ItemsControllerImp> {
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
          // controller.goToItems(controller.categories, selectCategories!);
          controller.chageSelectedCategories(
              selectCategories!, categoriesModel.categoriesId.toString());
        },
        child: GetBuilder<ItemsControllerImp>(
            builder: (controller) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: controller.selectedCategories ==
                                  selectCategories // عشان يحدد علي نص القسم اللي دخلت عليه م الهوم
                              ? const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: AppColor.primaryColor,
                                          width: 4)))
                              : null,
                          child:
                              myServices.sharedPreferences.getString("lang") ==
                                      "en"
                                  ? Text(
                                      "${categoriesModel.categoriesName}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.darkgray),
                                    )
                                  : Text(
                                      "${categoriesModel.categoriesNameAr}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.darkgray),
                                    )),
                    ),
                  ],
                )));
  }
}
