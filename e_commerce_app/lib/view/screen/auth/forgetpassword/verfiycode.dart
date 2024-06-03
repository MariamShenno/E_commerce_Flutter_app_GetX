import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/verifycode_controller.dart';
import '../../../widget/auth/customtextbody.dart';
import '../../../widget/auth/customtexttitle.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller =
        Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.backgroundColor,
        elevation: 0.0,
        title: Text(
          "verification Code",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorApp.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            const CustomTextTitle(
              text: "Check Code",
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextBody(
              text: "Please Enter the Digit Code Sent to mariyamshannov@gmail.com",
            ),
            const SizedBox(
              height: 25,
            ),
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: ColorApp.primaryColor,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationcode) {
                controller.goToResetPassword(verificationcode);
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
