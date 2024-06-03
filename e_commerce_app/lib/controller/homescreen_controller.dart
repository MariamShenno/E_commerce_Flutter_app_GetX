import 'package:e_commerce_app/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/notification.dart';
import '../view/screen/offers.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listpage = [
    const HomePage(),
    const OffersView(),
  const  NotificationView(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Settings"),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Profile"),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Favorite"),
        ),
      ],
    ),
  ];

  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "notification", "icon": Icons.notifications_active_outlined},
    {"title": "offers", "icon": Icons.person_pin_sharp},
    {"title": "settings", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
