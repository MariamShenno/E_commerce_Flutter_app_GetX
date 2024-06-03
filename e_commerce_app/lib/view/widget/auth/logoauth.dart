import 'package:e_commerce_app/core/constant/imageasset.dart';
import 'package:flutter/widgets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(ImageAsset.logo, height: 170,);
  }
}