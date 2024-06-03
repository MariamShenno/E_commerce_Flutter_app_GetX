import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/resetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombutton.dart';
import '../../../widget/auth/customtextbody.dart';
import '../../../widget/auth/customtextformfield.dart';
import '../../../widget/auth/customtexttitle.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.backgroundColor,
        elevation: 0.0,
        title: Text(
          "Reset Password",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorApp.grey),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) =>   HandlingDataRequest(
           statusRequest: controller.statusRequest,
              widget:
        Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            CustomTextTitle(
              text: "35".tr,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextBody(
              text: "35".tr,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextFormField(
              isNumber: false,
              valid: (val) {
                 return validInput(val!, 3, 40, "password");
              },
              mycontroller: controller.password,
              hintText: "13".tr,
              iconData: Icons.lock_outline,
              labelText: "19".tr,
            ),
            CustomTextFormField(
              isNumber: false,
              valid: (val) {
                 return validInput(val!, 3, 40, "password");
              },
              mycontroller: controller.repassword,
              hintText: "Re${"13".tr}",
              iconData: Icons.lock_outline,
              labelText: "19".tr,
            ),
            CustomButton(
              text: "33".tr,
              onPressed: () {
                controller.goToSucessResetPassword();
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
