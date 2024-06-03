import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cart_data.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  // CartController cartController = Get.put(CartController());
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  int countitems = 0;
  Myservices myServices = Get.find();
  CartData cartData = CartData(Get.find());

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  additems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    //star backend
    if (StatusRequest.success == statusRequest) {
      if (response['status' == "success"]) {
        // data.addAll(response ['data']);
        Get.rawSnackbar(
          messageText: const Text("تم إضافة المنتج إلى السلة"),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
      // end
    }
    update();
  }

  deleteitems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    //star backend
    if (StatusRequest.success == statusRequest) {
      if (response['status' == "success"]) {
        // data.addAll(response ['data']);
        Get.rawSnackbar(
          messageText: const Text("تم إزالة المنتج من السلة"),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
      // end
    }
    update();
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    //star backend
    if (StatusRequest.success == statusRequest) {
      if (response['status' == "success"]) {
        int countitems = 0;
        countitems = int.parse(response['data']);
        print("******************************");
        print("$countitems");
        // data.addAll(response ['data']);
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
      // end
    }
  }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "blue", "id": 2, "active": '0'},
    {"name": "yellow", "id": 3, "active": '1'}
  ];

  add() {
    additems(itemsModel.itemsId!);
    countitems++;
    update();
  }

  remove() {
    deleteitems(itemsModel.itemsId!);
    if (countitems > 0) {
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
