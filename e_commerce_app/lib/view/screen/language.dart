
import 'package:e_commerce_app/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../widget/language/custombuttonlaguage.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 20),
            CustomButtonLanguage(
              textbutton: "Ar",
              onPressed: () {
                controller.chageLang("er");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
             const SizedBox(height: 20),
            CustomButtonLanguage(
              textbutton: "En",
              onPressed: () {
                controller.chageLang("en");
                Get.toNamed(AppRoute.onBoarding);
              },
            )
          ],
        ),
      ),
    );
  }
}
