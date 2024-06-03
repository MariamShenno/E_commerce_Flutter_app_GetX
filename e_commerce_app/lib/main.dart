
import 'package:e_commerce_app/bindings/intialbindings.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp( 
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      // theme: ThemeData(
      //   textTheme: const TextTheme(
      //     headline1: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20,
      //       color: ColorApp.black,
      //     ),
      //     headline2: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 26,
      //       color: ColorApp.black,
      //     ),
      //     bodyText1: TextStyle(
      //         height: 2,
      //         color: ColorApp.grey,
      //         fontWeight: FontWeight.bold,
      //         fontSize: 17),
      //     bodyText2: TextStyle(
      //         height: 2,
      //         color: ColorApp.grey,
      //         fontSize: 14),
      //   ),
      //   primarySwatch: Colors.blue,
      // ),
     // home: const Language(),
    //  routes: routes,
    getPages: routes,
      initialBinding:InitialBindings() ,
    );
  }
}
