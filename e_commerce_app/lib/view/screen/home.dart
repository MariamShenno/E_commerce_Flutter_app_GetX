import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/core/class/handlingdataview.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/data/model/itemsmodel.dart';
import 'package:e_commerce_app/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../linkapi.dart';
import '../widget/customappbar.dart';
import '../widget/home/customcardhome.dart';
import '../widget/home/listcategorieshome.dart';
import '../widget/home/listitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ?  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                    // if(controller.settingsdata.isNotEmpty)  
                      CustomCardHome(
                          title: "${controller.titleHomeCard}",
                          body: "${controller.bodyHomeCard}",
                        ),
                     const   CustomTitleHome(title: "Categories"),
                      const  ListCategoriesHome(),
                      const  CustomTitleHome(title: "Top Selling"),
                      const  ListItemsHome(),
                      const  CustomTitleHome(title: "Offer"),
                      const  ListItemsHome(),
                      ],
                    )
                  : ListItemsSearch(listdatamodel: controller.listdata),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listdatamodel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
             controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              )),
            ));
      },
    );
  }
}
