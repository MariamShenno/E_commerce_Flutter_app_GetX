
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signupcontroller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombutton.dart';
import '../../widget/auth/customtextbody.dart';
import '../../widget/auth/customtextformfield.dart';
import '../../widget/auth/customtextsignuporsignin.dart';
import '../../widget/auth/customtexttitle.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => SignUpControllerImp());
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.backgroundColor,
        elevation: 0.0,
        title: Text(
          "17".tr,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorApp.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataRequest( 
            statusRequest: controller.statusRequest,
          widget:Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        CustomTextTitle(
                          text: "10".tr,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextBody(
                          text: "24".tr,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextFormField(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 3, 20, "username");
                          },
                          mycontroller: controller.username,
                          hintText: "23".tr,
                          iconData: Icons.person_outline,
                          labelText: "20".tr,
                        ),
                        CustomTextFormField(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 3, 40, "email");
                          },
                          mycontroller: controller.email,
                          hintText: "12".tr,
                          iconData: Icons.email_outlined,
                          labelText: "18".tr,
                        ),
                        CustomTextFormField(
                          isNumber: true,
                          valid: (val) {
                            return validInput(val!, 7, 11, "phone");
                          },
                          mycontroller: controller.phone,
                          hintText: "22".tr,
                          iconData: Icons.phone_android_outlined,
                          labelText: "21".tr,
                        ),
                        CustomTextFormField(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 3, 30, "password");
                          },
                          mycontroller: controller.password,
                          hintText: "13".tr,
                          iconData: Icons.lock_outline,
                          labelText: "19".tr,
                        ),
                        CustomButton(
                          text: "17".tr,
                          onPressed: () {
                            controller.sigUp();
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextSignUpOrSignIn(
                          textone: "25".tr,
                          texttwo: "26".tr,
                          onTap: () {
                            controller.goToSignIn();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ),
        ),
      ),
    );
  }
}
