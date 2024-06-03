import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  Myservices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  bool isshowpassword = true;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(password.text, email.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == "1") {
            myServices.sharedPreferences
                .setString("id", response['data']['users_id']);
                String? userid = myServices.sharedPreferences.getString("id");
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");
            // notification all users
            FirebaseMessaging.instance.subscribeToTopic("users");
            // notification specific users
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");
            Get.offNamed(AppRoute.homePage);
          } else {
            Get.toNamed(AppRoute.verifyCodeSignUp, arguments: {
              "email": email.text,
            });
          }
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      // ignore: unused_local_variable
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
