import 'package:e_commerce_app/core/class/handlingdataview.dart';
import 'package:e_commerce_app/view/widget/auth/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/address/adddetails_controller.dart';
import '../../core/shared/custombutton.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsController controller =
        Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Add Details Address"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder <AddAddressDetailsController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
             widget: ListView(
            children: [
              CustomTextFormField(
                hintText: "city",
                labelText: "city",
                iconData: Icons.location_city,
                mycontroller: controller.city,
                valid: (val) {
                  return null;
                },
                isNumber: false,
              ),
              CustomTextFormField(
                hintText: "street",
                labelText: "street",
                iconData: Icons.streetview,
                mycontroller: controller.street,
                valid: (val) {
                  return null;
                },
                isNumber: false,
              ),
              CustomTextFormField(
                hintText: "name",
                labelText: "name",
                iconData: Icons.near_me,
                mycontroller: controller.name,
                valid: (val) {
                  return null;
                },
                isNumber: false,
              ),
              CustomButton(
                text: "Add",
                onPressed: () {
                  controller.addAddress();
                },
              ),
            ],
          ),
             ) ,
          
        ),
      ),
    );
  }
}
