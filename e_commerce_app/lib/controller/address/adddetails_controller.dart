import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/address_data.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = AddressData(Get.find());

  Myservices myServices = Get.find();
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  String? lat;
  String? long;

  intialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];

    print(lat);
    print(long);
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homePage);
        Get.snackbar("Error", "Now, You can order to this Address");
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
