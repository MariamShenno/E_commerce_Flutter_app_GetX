import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSucessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  String? email;

  StatusRequest statusRequest = StatusRequest.none ;

 GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  @override
  goToSucessResetPassword()async {
if(password.text != password.text){
   return Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
}
if(formstate.currentState!.validate()){
statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postdata(
        email! , password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
            Get.offNamed(AppRoute.successResetPassword);
        } else {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: "Try Again");
          statusRequest = StatusRequest.failure;
        }
      }
     
      update();
 
} else{
    print("Not Valid");
}
      
  }

  @override
  resetPassword() {}

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
