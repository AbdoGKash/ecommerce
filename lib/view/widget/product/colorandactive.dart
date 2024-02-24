import 'package:ecommerce/controller/home/productdatils_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class ColorAndActive extends GetView<ProductDatilsControllerImp> {
  const ColorAndActive({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          ...List.generate(
              controller.colorAndActive.length,
              (index) => InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              controller.colorAndActive[index]['active'] == "1"
                                  ? AppColor.homeColor
                                  : null,
                          border: Border.all(color: AppColor.homeColor)),
                      child: Center(
                          child: Text(
                        "${controller.colorAndActive[index]['name']}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: controller.colorAndActive[index]['active'] ==
                                    "1"
                                ? AppColor.white
                                : AppColor.homeColor),
                      )),
                    ),
                  )),
        ],
      ),
    );
  }
}
