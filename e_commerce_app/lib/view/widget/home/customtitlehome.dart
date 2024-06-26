import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomTitleHome extends StatelessWidget {
  const CustomTitleHome({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
          style: const TextStyle(
              fontSize: 20,
              color: ColorApp.primaryColor,
              fontWeight: FontWeight.bold)),
    );
  }
}
