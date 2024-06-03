import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/cart_data.dart';
import 'package:e_commerce_app/data/model/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdata.dart';
import '../data/model/couponmodel.dart';

class CartController extends GetxController {
  TextEditingController? controllercoupon;
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  Myservices myServices = Get.find();
  List<CartModel> data = [];
  double priceorders = 0.0;
  int totalcountitems = 0;
  CouponModel? couponModel;
  int? discountcoupon = 0;
  String? couponname;
  String? couponid;

  add(String itemsid) async {
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

  goToPageCheckout() {
    if (data.isEmpty) {
      return Get.snackbar("تنبيه", "السلةفارغة");
    }
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": priceorders.toString(),
      "discountcoupon": discountcoupon.toString(),
    });
  }

  delete(String itemsid) async {
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

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    //star backend
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == "success") {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = int.parse(dataresponsecountprice['totalcount']);
          priceorders = double.parse(dataresponsecountprice['totalprice']);
          print(priceorders);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // end
    }
    update();
  }

  getTotalPrice() {
    return (priceorders - priceorders * discountcoupon! / 100);
  }

  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllercoupon!.text);
    statusRequest = handlingData(response);
    //star backend
    if (StatusRequest.success == statusRequest) {
      if (response['status' == "success"]) {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount!);
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;
      } else {
        //statusRequest = StatusRequest.failure;
        discountcoupon = 0;
        couponname = null;
        couponid = null;
         Get.snackbar("Warning", "Coupon Not Valid") ;
      }
      // end
    }
    update();
  }

  resetVariableCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVariableCart();
    view();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }
}
