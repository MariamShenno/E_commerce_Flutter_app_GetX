import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;

  Myservices myservices = Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myservices.sharedPreferences.setString("step", "1");
//print("page 4");
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(
        currentPage++,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
