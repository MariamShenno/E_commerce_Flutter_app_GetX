import 'package:e_commerce_app/controller/onboarding_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: ((value) {
        // print(value);
        controller.onPageChanged(value);
      }),
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Text(
            onBoardingList[i].title!,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: ColorApp.black),
          ),
          const SizedBox(height: 50),
          Image.asset(
            onBoardingList[i].image!,
            width: 200,
            height: 200,
           // height: Get.width/1.5,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 50),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  height: 2,
                  color: ColorApp.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
