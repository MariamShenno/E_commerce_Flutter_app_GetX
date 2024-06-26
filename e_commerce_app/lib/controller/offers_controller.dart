import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';
import '../data/datasource/remote/offers_data.dart';
import 'home_controller.dart';

class OffersController extends SearchMixController {
  OfferData offerData = OfferData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offerData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status' == "success"]) {
        List listdata2 = response ['data'];
        data.addAll(listdata2.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
