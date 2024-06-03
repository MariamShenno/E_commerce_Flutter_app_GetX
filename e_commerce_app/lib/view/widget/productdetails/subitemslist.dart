import 'package:e_commerce_app/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class SubitemsList extends GetView<ProductDetailsControllerImp> {
  const SubitemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 5),
            height: 60,
            width: 90,
            decoration: BoxDecoration(
              color: controller.subitems[index]['active'] == '1'
                  ? ColorApp.fourthColor
                  : Colors.white,
              border: Border.all(color: ColorApp.fourthColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "Black",
              style: TextStyle(
                color: controller.subitems[index]['active'] == '1'
                    ? Colors.white
                    : ColorApp.fourthColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
