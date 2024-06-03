import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
 final String text;
 final void Function()? onPressed;
  const CustomButton({super.key, required this.text,  this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 12),
        onPressed: onPressed,
        color: ColorApp.primaryColor,
        textColor: Colors.white,
        child: Text(text),
        ),
    );
  }
}