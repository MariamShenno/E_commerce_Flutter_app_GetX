import 'package:e_commerce_app/controller/onboarding_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomButtonOnBoarding extends GetView <OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    height:50,
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical: 0,
                      ),
                      textColor: Colors.white,
                      onPressed: () {
                        controller.next();
                      },
                      color: ColorApp.primaryColor,
                      child:  Text("8".tr),
                    ),
                  );
  }
}