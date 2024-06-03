import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtoAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool? active;
  const CustomButtoAppBar(
      {super.key,
      required this.onPressed,
      required this.textbutton,
      required this.icondata,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icondata,
            color: active == true ? ColorApp.primaryColor : ColorApp.grey2,
          ),
          Text(
            textbutton,
            style: TextStyle(
              color: active == true ? ColorApp.primaryColor : ColorApp.grey2,
            ),
          ),
        ],
      ),
    );
  }
}
