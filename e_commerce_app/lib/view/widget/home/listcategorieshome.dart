import 'package:e_commerce_app/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatefatabase.dart';
import '../../../linkapi.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
          i : index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView <HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, required this.i}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
controller.goToItems(
  controller.categories,
  i!,
  categoriesModel.categoriesId!
);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorApp.thirdColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            color: ColorApp.secondColor,
            child: SvgPicture.network(
                "${AppLink.imagestCategories}/${categoriesModel.categoriesImage}",
                 color: ColorApp.secondColor),
          ),
          Text(
            "${translateDatabase(categoriesModel.categoriesNamaAr, categoriesModel.categoriesName)}",
            style: const TextStyle(fontSize: 13, color: ColorApp.black),
          ),
        ],
      ),
    );
  }
}
