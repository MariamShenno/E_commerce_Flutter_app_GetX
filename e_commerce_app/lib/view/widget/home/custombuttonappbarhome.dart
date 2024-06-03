import 'package:e_commerce_app/controller/homescreen_controller.dart';
import 'package:e_commerce_app/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAppBarHome extends StatelessWidget {
  const CustomButtonAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(
              controller.listpage.length,
              (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomButtoAppBar(
                        onPressed: () {
                          controller.changePage(i);
                        },
                        textbutton: controller.bottomappbar[i]['title'],
                        icondata: controller.bottomappbar[i]['icon'],
                        active: controller.currentpage == i ? true : false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
