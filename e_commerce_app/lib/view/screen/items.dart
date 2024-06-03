import 'package:e_commerce_app/core/class/handlingdataview.dart';
import 'package:e_commerce_app/data/model/itemsmodel.dart';
import 'package:e_commerce_app/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/favorite_controller.dart';
import '../../controller/items_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/customappbar.dart';
import '../widget/items/CustomListItems.dart';
import '../widget/items/listcategoirseitems.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              mycontroller: controller.search!,
              titleappbar: "Find Product",
              //onPressedIcon: () {},
              onPressedSearch: () {
                controller.onSearchItems();
              },
              onPressedIconFavorite: () {
                Get.toNamed(AppRoute.myfavroite);
              },
              onChanged: (val) {
                controller.checkSearch(val);
              },
            ),
            const SizedBox(height: 20),
            const ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (BuildContext context, index) {
                          controllerFav.isFavorite[controller.data[index]
                                  ['items_id']] =
                              controller.data[index]['favorite'];
                          return CustomListItems(
                            // active: true,
                            itemsModel:
                                ItemsModel.fromJson(controller.data[index]),
                          );
                        },
                      )
                    : ListItemsSearch(listdatamodel: controller.listdata),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
