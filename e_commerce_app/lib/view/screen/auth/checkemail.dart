// import 'package:e_commerce_app/core/constant/color.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../controller/auth/checkemail_controller.dart';
// import '../../widget/auth/custombutton.dart';
// import '../../widget/auth/customtextbody.dart';
// import '../../widget/auth/customtextformfield.dart';
// import '../../widget/auth/customtexttitle.dart';


// class CheckEmail extends StatelessWidget {
//   const CheckEmail({super.key});

//   @override
//   Widget build(BuildContext context) {
//     CheckEmailControllerImp controller =
//         Get.put(CheckEmailControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: ColorApp.backgroundColor,
//         elevation: 0.0,
//         title: Text(
//           "27".tr,
//           style: Theme.of(context)
//               .textTheme
//               .headline1!
//               .copyWith(color: ColorApp.grey),
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//         child: ListView(
//           children: [
//              CustomTextTitle(
//               text: "28".tr,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//              CustomTextBody(
//               text:
//                  "29".tr,
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             CustomTextFormField(
//                valid: (val){
                
//               },
//               mycontroller: controller.email,
//               hintText: "12".tr,
//               iconData: Icons.email_outlined,
//               labelText: "18".tr,
//             ),
//             CustomButton(
//               text: "30".tr,
//               onPressed: () {
//                 controller.goToVerifyCode();
//               },
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
