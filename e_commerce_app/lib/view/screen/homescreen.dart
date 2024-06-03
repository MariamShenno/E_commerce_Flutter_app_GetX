import 'dart:io';

import 'package:e_commerce_app/controller/homescreen_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/home/custombuttonappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorApp.primaryColor,
          onPressed: () {
            Get.toNamed(AppRoute.mycart);
          },
          child: const Icon(
            Icons.shopping_basket_outlined,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomButtonAppBarHome(),
        body: WillPopScope(
          child: controller.listpage.elementAt(controller.currentpage),
          onWillPop: () {
            Get.defaultDialog(
              title: "Warning",
              titleStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorApp.primaryColor,
              ),
              middleText: "Do you want to exit the application",
              onConfirm: () {
                exit(0);
              },
              confirmTextColor: ColorApp.secondColor,
              onCancel: () {},
              cancelTextColor: ColorApp.secondColor,
              buttonColor: ColorApp.thirdColor,
            );
            return Future.value(false);
          },
        ),
      ),
    );
  }
}
