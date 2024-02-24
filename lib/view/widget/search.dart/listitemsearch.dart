import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../applink.dart';
import '../../../core/services/services.dart';
import '../../../data/model/itemsmodel.dart';

class ListItemSearch extends StatelessWidget {
  final List<ItemsModel> listDataModel;
  const ListItemSearch({super.key, required this.listDataModel});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listDataModel.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: InkWell(
              onTap: () {
                // Get.toNamed(AppRoute.productDatils);
              },
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.network(
                                "${AppLink.imageitems}/${listDataModel[index].itemsImage}"))),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                          title:
                              myServices.sharedPreferences.getString("lang") ==
                                      "en"
                                  ? Text(
                                      "${listDataModel[index].itemsName}",
                                      style: const TextStyle(
                                          fontFamily: "", fontSize: 15),
                                    )
                                  : Text(
                                      "${listDataModel[index].itemsNameAr}",
                                      style: const TextStyle(
                                          fontFamily: "", fontSize: 15),
                                    )),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
