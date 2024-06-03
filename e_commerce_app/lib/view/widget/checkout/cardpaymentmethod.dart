
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout({super.key, 
  required this.title, 
  required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),

              decoration:  BoxDecoration(
                color: isActive == true ? ColorApp.secondColor : ColorApp.thirdColor,
                ),
                child: Text(title,
                style: TextStyle(
                  color: isActive == true ? Colors.white : ColorApp.secondColor,
                  height: 1,
                  fontWeight: FontWeight.bold,
                ),
                ),
              );
            
  }
}