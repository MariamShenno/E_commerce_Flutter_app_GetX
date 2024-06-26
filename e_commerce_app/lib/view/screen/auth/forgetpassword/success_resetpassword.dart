import 'package:e_commerce_app/controller/auth/successresetpassword_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/view/widget/auth/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
        SuccessResetPasswordControllerImp controller = Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.backgroundColor,
        elevation: 0.0,
        title: Text("Success",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: ColorApp.grey)),
      ),
      body: Container(
        padding:  const EdgeInsets.all(15),
        child: Column(
          children:  [
            const Center(
              child:  Icon(Icons.check_circle_outline,
              size: 200,
              color: ColorApp.primaryColor,),
            ),
            Text("37".tr, 
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 30),
            ),
            Text("36".tr,),
           const Spacer(),
           SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: "31".tr,
              onPressed: (){
                controller.goToPageLogin();
              },
              ),
           ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}