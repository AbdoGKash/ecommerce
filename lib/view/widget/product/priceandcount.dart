import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class PriceAndCount extends GetView {
  // final Function()? onAdd;
  // final Function()? onRemove;
  final String price;
  final String count;
  const PriceAndCount(
      {super.key,
      // required this.onAdd,
      // required this.onRemove,
      required this.price,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Container(
        //   margin: const EdgeInsets.all(10),
        //   child: Row(
        //     children: [
        //       IconButton(
        //           onPressed: onAdd,
        //           icon: const Icon(Icons.add, color: AppColor.homeColor)),
        //       Container(
        //         height: 40,
        //         width: 60,
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             // color: AppColor.homeColor,
        //             border: Border.all(color: AppColor.homeColor)),
        //         child: Center(
        //             child: Text(
        //           count,
        //           style: const TextStyle(
        //               fontFamily: "snsn",
        //               fontSize: 20,
        //               fontWeight: FontWeight.bold,
        //               color: AppColor.homeColor),
        //         )),
        //       ),
        //       IconButton(
        //           onPressed: onRemove,
        //           icon: const Icon(Icons.remove_outlined,
        //               color: AppColor.homeColor)),
        //     ],
        //   ),
        // ),
        Text(
          "$price\$",
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor2,
              fontSize: 25,
              fontFamily: "snsn"),
        )
      ],
    );
  }
}
