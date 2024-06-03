import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/checkout_date.dart';
import 'package:e_commerce_app/data/model/addressmodel.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';
import '../data/datasource/remote/address_data.dart';

class CheckoutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutdata = Get.put(CheckoutData(Get.find()));

  Myservices myServices = Get.find();

  List<AddressModel> dataaddress = [];

  String? paymentMethod;
  String? deliveryType;
  String? addresid = "0";

  late String couponid;
  late String priceorders;
  late String coupondiscount;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addresid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addresid = dataaddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select a order Type");
    }
    if(dataaddress.isEmpty){
      return Get.snackbar("Error", "Please select Shipping Address");
    }
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addresid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders,
      "couponid": couponid,
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString(),
    };

    var response = await checkoutdata.checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homePage);
        Get.snackbar("Success", "the order was successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again");
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }
}
