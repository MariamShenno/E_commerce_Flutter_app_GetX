import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/myfavorite_controller.dart';
import 'package:e_commerce_app/core/functions/translatefatabase.dart';
import 'package:e_commerce_app/data/model/myfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsModel;
  //final bool active;
  const CustomListFavoriteItems({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
     //   controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${itemsModel.itemsId}",
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imagestItems}/${itemsModel.itemsImage!}",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rating 3.5",
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 22,
                    child: Row(
                      children: [
                        ...List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star,
                                  size: 15,
                                ))
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${itemsModel.itemsPrice}\$",
                    style: const TextStyle(
                      color: ColorApp.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "sans",
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      controller.deletefromfavroite(itemsModel.favoriteId!);
                    },
                     icon: const Icon(Icons.delete_outline_outlined,
                     color: ColorApp.red,
                     ),
                      ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
