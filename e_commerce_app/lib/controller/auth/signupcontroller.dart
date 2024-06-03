import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handlingdata.dart';
import 'package:e_commerce_app/data/datasource/remote/auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  sigUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
   StatusRequest statusRequest = StatusRequest.none ;

  SignupData signupData = SignupData(Get.find());
  List data = [];



  @override
  sigUp() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(
          username.text, password.text, email.text, phone.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verifyCodeSignUp, arguments: {
            "email": email.text
          });
        } else {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: "Phone Number Or Email Already Exists");
          statusRequest = StatusRequest.failure;
        }
      }
     
      update();
    } else {
      print("Not Valid");
    }
  }
  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }
  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
