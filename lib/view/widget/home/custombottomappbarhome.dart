import 'package:ecommerce/controller/home/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custombottomappbar.dart';

class CustomButtomAppBarHome extends StatelessWidget {
  const CustomButtomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            height: 68,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(controller.bottomAppBar.length + 1, (index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2
                      ? const Spacer()
                      : CustomBottomAppBar(
                          icon: controller.bottomAppBar[i]['icon'],
                          text: controller.bottomAppBar[i]['titel'],
                          onPressed: () {
                            controller.changePage(i);
                          },
                          active: controller.curentPage == i,
                        );
                })
              ],
            )));
  }
}
