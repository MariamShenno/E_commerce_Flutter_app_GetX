
import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid ;
  final bool isNumber;
  final bool? obscureText;
  final void Function()?onTapIcon;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.iconData,
    required   this.mycontroller,
     required this.valid, 
     required this.isNumber, 
     this.obscureText, 
     this.onTapIcon,
     });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        keyboardType: isNumber ?  const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
        validator: valid,
        controller:mycontroller ,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child:  Text(labelText),
          ),
          suffixIcon:  InkWell(
            onTap: onTapIcon,
            child: Icon(iconData),
            ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
