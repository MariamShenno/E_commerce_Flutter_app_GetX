import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  Myservices myServices = Get.find();
  logout() {
    String userid = myServices.sharedPreferences.getString("id")!;
    // notification all users
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    // notification specific users
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
