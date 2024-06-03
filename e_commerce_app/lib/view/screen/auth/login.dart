import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/functions/validinput.dart';
import 'package:e_commerce_app/view/widget/auth/customtextsignuporsignin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/logincontroller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../widget/auth/custombutton.dart';
import '../../widget/auth/customtextbody.dart';
import '../../widget/auth/customtextformfield.dart';
import '../../widget/auth/customtexttitle.dart';
import '../../widget/auth/logoauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.backgroundColor,
        elevation: 0.0,
        title: Text(
          "15".tr,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorApp.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(

       statusRequest: controller.statusRequest,
       widget: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formState,
            child: ListView(
              children: [
                const LogoAuth(),
                CustomTextTitle(
                  text: "10".tr,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextBody(
                  text: "11".tr,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormField(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 100, "email");
                  },
                  mycontroller: controller.email,
                  hintText: "12".tr,
                  iconData: Icons.email_outlined,
                  labelText: "18".tr,
                ),
                GetBuilder<LoginControllerImp>(
                  builder: (controller) => CustomTextFormField(
                    onTapIcon: () {
                      controller.showPassword();
                    },
                    obscureText: controller.isshowpassword,
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    mycontroller: controller.password,
                    hintText: "13".tr,
                    iconData: Icons.lock_outline,
                    labelText: "19".tr,
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.goToForgetPassword();
                  },
                  child: Text(
                    "14".tr,
                    textAlign: TextAlign.end,
                  ),
                ),
                CustomButton(
                  text: "15".tr,
                  onPressed: () {
                    controller.login();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextSignUpOrSignIn(
                  textone: "16".tr,
                  texttwo: "17".tr,
                  onTap: () {
                    controller.goToSignUp();
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
