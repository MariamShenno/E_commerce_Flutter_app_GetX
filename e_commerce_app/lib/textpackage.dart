import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class TextPackage extends StatefulWidget {
  const TextPackage({super.key});

  @override
  State<TextPackage> createState() => _TextPackageState();
}

class _TextPackageState extends State<TextPackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: ColorApp.primaryColor,
              showFieldAsBox: true,
              onCodeChanged: (String code){

              } ,
              onSubmit: (String verificationcode){

              },
            ),
           ],
        ),
      ),
    );
  }
}