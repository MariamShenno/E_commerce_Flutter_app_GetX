import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/controller/items_controller.dart';
import 'package:e_commerce_app/core/constant/imageasset.dart';
import 'package:e_commerce_app/core/functions/translatefatabase.dart';
import 'package:e_commerce_app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class CustomListItemsOffers extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  //final bool active;
  const CustomListItemsOffers({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imagestItems}/${itemsModel.itemsImage!}",
                      fit: BoxFit.fill,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    translateDatabase(
                        itemsModel.itemsNameAr, itemsModel.itemsName!),
                    style: const TextStyle(
                        color: ColorApp.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text(
                  //       "Rating 3.5",
                  //       textAlign: TextAlign.center,
                  //     ),
                  //     Container(
                  //       alignment: Alignment.bottomCenter,
                  //       height: 22,
                  //       child: Row(
                  //         children: [
                  //           ...List.generate(
                  //               5,
                  //               (index) => const Icon(
                  //                     Icons.star,
                  //                     size: 15,
                  //                   ))
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemsModel.itemsPriceDiscount}\$",
                        style: const TextStyle(
                          color: ColorApp.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans",
                        ),
                      ),
                      GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isFavorite[itemsModel.itemsId] ==
                                "1") {
                              controller.setFavorite(itemsModel.itemsId, "0");
                              controller.removeFavorite(itemsModel.itemsId!);
                            } else {
                              controller.setFavorite(itemsModel.itemsId, "1");
                              controller.addFavorite(itemsModel.itemsId!);
                            }
                          },
                          icon: Icon(
                            controller.isFavorite[itemsModel.itemsId] == "1"
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: ColorApp.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            if (itemsModel.itemsDiscount !=  "0")
              Positioned(
                top: 4,
                left: 4,
                child: Image.asset(
                  ImageAsset.sale,
                  width: 40,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
