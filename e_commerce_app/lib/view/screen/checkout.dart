import 'package:e_commerce_app/controller/checkout_controller.dart';
import 'package:e_commerce_app/core/class/handlingdataview.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/constant/imageasset.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/view/widget/checkout/cardshippingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/checkout/carddeliveerytype.dart';
import '../widget/checkout/cardpaymentmethod.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: ColorApp.secondColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: const Text("Checkout",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          )),
      body: GetBuilder<CheckoutController>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                const Text(
                  "Choose Payment Method",
                  style: TextStyle(
                      color: ColorApp.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.choosePaymentMethod("0"); //cash
                  },
                  child: CardPaymentMethodCheckout(
                      title: "Cash On Delivery",
                      isActive: controller.paymentMethod == "0" ? true : false),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.choosePaymentMethod("1"); // card
                  },
                  child: CardPaymentMethodCheckout(
                    title: "Payment Cards",
                    isActive: controller.paymentMethod == "1" ? true : false,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Choose Delivery Type",
                  style: TextStyle(
                      color: ColorApp.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.chooseDeliveryType("0"); // delivery
                  },
                  child: CardDeliveryTypeCheckout(
                      imagename: ImageAsset.deliveryCheckout,
                      title: "Delivery",
                      active: controller.deliveryType == "0" ? true : false),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    controller.chooseDeliveryType("1"); // recive
                  },
                  child: CardDeliveryTypeCheckout(
                      imagename: ImageAsset.deliveryThruCheckout,
                      title: "Recive",
                      active: controller.deliveryType == "1" ? true : false),
                ),
                const SizedBox(height: 20),
                if (controller.deliveryType == "0")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.dataaddress.isNotEmpty)
                      const Text(
                        "Shipping Address",
                        style: TextStyle(
                            color: ColorApp.secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      if (controller.dataaddress.isEmpty)
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoute.addressadd);
                          },
                          child:   Container(
                            child: const Center(
                                child: Text(
                              "Please Add Address \n Click Here",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: ColorApp.primaryColor,
                              fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      const SizedBox(height: 10),
                      ...List.generate(
                        controller.dataaddress.length,
                        (index) => InkWell(
                          onTap: () {
                            controller.chooseShippingAddress(
                                controller.dataaddress[index].addressId!);
                          },
                          child: CardShppingAddressCheckout(
                            title:
                                "${controller.dataaddress[index].addressName}",
                            body:
                                "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                            isactive: controller.addresid ==
                                    controller.dataaddress[index].addressId
                                ? true
                                : false,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
