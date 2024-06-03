import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/core/class/handlingdataview.dart';
import 'package:e_commerce_app/view/screen/home.dart';
import 'package:e_commerce_app/view/widget/offers/CustomListItemsOffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/offers_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/customappbar.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return GetBuilder<OffersController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
            const  SizedBox(height: 20),
      controller.isSearch? HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.data.length,
            itemBuilder: ((context, index) => CustomListItemsOffers(
                  itemsModel: controller.data[index],
                )),
          ),
        ): ListItemsSearch(listdatamodel: controller.listdata,),
      ],
        ),
      ),
    );
  }
}
