import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../widget/auth/custombutton.dart';
import '../../../widget/auth/customtextbody.dart';
import '../../../widget/auth/customtextformfield.dart';
import '../../../widget/auth/customtexttitle.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.backgroundColor,
        elevation: 0.0,
        title: Text(
          "14".tr,
          style: Theme.of(context)
              .textTheme.titleMedium?.copyWith(color: ColorApp.grey),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
           statusRequest: controller.statusRequest,
              widget:
         Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
             CustomTextTitle(
              text: "27".tr,
            ),
            const SizedBox(
              height: 10,
            ),
             CustomTextBody(
              text:
                  "29".tr,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextFormField(
              isNumber: false,
               // ignore: body_might_complete_normally_nullable
               valid: (val){
                
              },
              mycontroller: controller.email,
              hintText:"12".tr,
              iconData: Icons.email_outlined,
              labelText: "18".tr,
            ),
            CustomButton(
              text: "30".tr,
              onPressed: () {
                controller.checkEmail();
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
        ),
      ),
    );
  }
}
