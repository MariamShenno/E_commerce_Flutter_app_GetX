
// import 'package:e_commerce_app/core/constant/color.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';
// import '../../../controller/auth/verifycodesignup_controller.dart';
// import '../../../core/class/handlingdataview.dart';
// import '../../widget/auth/customtextbody.dart';
// import '../../widget/auth/customtexttitle.dart';


// class VerfiyCodeSignUp extends StatelessWidget {
//   const VerfiyCodeSignUp({super.key});

//   @override
//   Widget build(BuildContext context) {
   
//         Get.put(VerifyCodeSignUpControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: ColorApp.backgroundColor,
//         elevation: 0.0,
//         title: Text(
//           "verification Code",
//           style: Theme.of(context)
//               .textTheme
//               .headline1!
//               .copyWith(color: ColorApp.grey),
//         ),
//       ),
//       body: GetBuilder <VerifyCodeSignUpControllerImp>(
//         builder: (controller) =>  HandlingDataRequest(
//            statusRequest: controller.statusRequest,
//               widget:Container(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//         child: ListView(
//           children: [
//             const CustomTextTitle(
//               text: "Check Code",
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//              CustomTextBody(
//               text: "Please Enter the Digit Code Sent To ${controller.email}"
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             OtpTextField(
//               fieldWidth: 50.0,
//               borderRadius: BorderRadius.circular(20),
//               numberOfFields: 5,
//               borderColor: ColorApp.primaryColor,
//               showFieldAsBox: true,
//               onCodeChanged: (String code) {},
//               onSubmit: (String verificationcode) {
//                 controller.goToSuccessSignUp(verificationcode);
//               },
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             InkWell(
//               onTap: (){
//                controller.reSend();
//               },
//               child:const Center(
//                 child:  Text(
//                   "Resend verfiy code" , style: TextStyle(color: ColorApp.primaryColor , fontSize: 20 ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//         ),
//       ),
//     );
//   }
// }
