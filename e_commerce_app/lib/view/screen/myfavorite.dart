import 'package:e_commerce_app/controller/myfavorite_controller.dart';
import 'package:e_commerce_app/core/class/handlingdataview.dart';
import 'package:e_commerce_app/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(
          builder: (controller) => ListView(
            children: [
              // CustomAppBar(
              //   titleappbar: "Find Product",
              //   //onPressedIcon: () {},
              //   onPressedSearch: () {},
              //   onPressedIconFavorite: () {
              //     Get.toNamed(AppRoute.myfavroite);
              //   },
              // ),
              const SizedBox(height: 20),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      ),
                  itemBuilder: (Context, index) {
                    return CustomListFavoriteItems(
                      itemsModel: controller.data[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
