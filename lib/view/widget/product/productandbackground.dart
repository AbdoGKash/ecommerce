import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home/productdatils_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../applink.dart';
import '../../../core/constant/color.dart';

class ProductAndBackground extends GetView<ProductDatilsControllerImp> {
  const ProductAndBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip
          .none, // لمنه اختفاء الاشياء الاخري اللي ف الاستاك لو خدت حجم اكبر
      children: [
        Container(
          height: 130,
          decoration: const BoxDecoration(
              color: AppColor.primaryColor2,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        ),
        Positioned(
          // top: 0,
          right: 60,
          left: 60,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imageitems}/${controller.itemsModel.itemsImage}",
              height: 250,
              // fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
