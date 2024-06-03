import 'package:e_commerce_app/controller/settings_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/constant/imageasset.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width / 3,
              color: ColorApp.primaryColor,
            ),
            Positioned(
              top: Get.width / 3.9,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[100],
                  backgroundImage: const AssetImage(ImageAsset.userAvater),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 100),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ListTile(
                //   //onTap: () {},
                //   title: const Text("Disable Notificatios"),
                //   trailing: Switch(
                //     value: true,
                //     onChanged: (val) {},
                //   ),
                // ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.orderspending);
                  },
                  trailing: const Icon(Icons.card_travel),
                  title: const Text("Orders"),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.ordersarchive);
                  },
                  trailing: const Icon(Icons.card_travel),
                  title: const Text("Archive"),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.addressview);
                  },
                  title: const Text("Address"),
                  trailing: const Icon(Icons.location_on_outlined),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text("About us"),
                  trailing: const Icon(Icons.help_outline_rounded),
                ),
                ListTile(
                  onTap: () async {
                   await  launchUrl(Uri.parse("tel:0123456789"));
                  },
                  title: const Text("Contact us"),
                  trailing: const Icon(Icons.phone_callback_outlined),
                ),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
