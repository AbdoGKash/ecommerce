import 'package:ecommerce/controller/home/home_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/search.dart/listitemsearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/search.dart/searchboxandbackground.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<HomeControllerImp>(builder: (controller) {
      return ListView(
        children: [
          const SearchBoxAndBackground(),
          !controller.isSearch
              ? Container(
                  alignment: Alignment.center,
                  child: Text(
                    "There are no searches".tr,
                    style: const TextStyle(
                        color: AppColor.primaryColor2, fontSize: 20),
                  ),
                )
              : ListItemSearch(listDataModel: controller.listData)
        ],
      );
    }));
  }
}
