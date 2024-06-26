import 'package:e_commerce_app/controller/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/class/handlingdataview.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
        ),
        body: GetBuilder <TestController>(
          builder: (controller){

            return HandlingDataView(
              statusRequest: controller.statusRequest ,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context , index){
                  return Text("${controller.data}");
                }
                ),
            );
         
          
          },
          ),
    );
  }
}