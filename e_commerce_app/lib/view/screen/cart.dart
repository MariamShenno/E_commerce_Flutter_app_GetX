import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/cart/custom_bottom_navgationbar_cart.dart';
import '../widget/cart/customitemscartlist.dart';
import '../widget/cart/topcardcart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) => BottomNavgationBarCart(
          shipping: "0",
          controllercoupon: controller.controllercoupon!,
          onApplyCoupon: () {
            controller.checkcoupon();
          },
          price: "${cartController.priceorders}",
          discount: "${controller.discountcoupon}",
          totalprice: "${controller.getTotalPrice()}",
        ),
      ),
      body: GetBuilder<CartController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const SizedBox(height: 10),
              TopCardCart(
                  message:
                      "You Have ${cartController.totalcountitems} Items in your List"),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ...List.generate(
                      cartController.data.length,
                      (index) => CustomItemsCartList(
                        onAdd: () async {
                          await cartController
                              .add(cartController.data[index].itemsId!);
                          cartController.refreshPage();
                        },
                        onRemove: () async {
                          await cartController
                              .delete(cartController.data[index].itemsId!);
                          cartController.refreshPage();
                        },
                        imagename: "${cartController.data[index].itemsImage}",
                        name: "${cartController.data[index].itemsName}",
                        price: "${cartController.data[index].itemsPrice}\$",
                        count: "${cartController.data[index].countitems}",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
