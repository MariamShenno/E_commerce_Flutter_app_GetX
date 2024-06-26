import 'package:e_commerce_app/core/constant/apptheme.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../functions/fcmconfig.dart';

class LocalController extends GetxController{

  Locale? language;

  Myservices myservices = Get.find();

  ThemeData appTheme = themeEnglish;


  chageLang(String languagecode){

    Locale locale = Locale(languagecode);
    myservices.sharedPreferences.setString("lang", languagecode);
    appTheme = languagecode == "ar" ? themeArabic : themeEnglish ;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestPerLocation() async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشغيل خدمو تحديد الموقع");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية الموقع للتطبيق");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق من دون اللوكيشين");
    }
  }


  @override
  void onInit(){
    requestPermissionNotification();
    fcmconfig();
    requestPerLocation() ;
String? sharedPrefLang = myservices.sharedPreferences.getString("lang");
  if(sharedPrefLang == "ar"){
    language = const Locale("ar");
    appTheme = themeArabic;
  }
  else if(sharedPrefLang == "en"){
language = const Locale("en");
appTheme = themeEnglish;
  }
  else{
    language = Locale(Get.deviceLocale!.languageCode);
    appTheme = themeEnglish;
  }
  super.onInit();
  
  }
}