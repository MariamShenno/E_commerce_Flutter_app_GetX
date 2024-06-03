// import 'package:e_commerce_app/core/constant/routes.dart';
// import 'package:e_commerce_app/data/datasource/remote/auth/verifycodesignup.dart';
// import 'package:get/get.dart';
// import '../../core/class/statusrequest.dart';
// import '../../core/functions/handlingdata.dart';

// abstract class VerifyCodeSignUpController extends GetxController {
//   checkCode();
//   goToSuccessSignUp(String verfiyCodeSignUp);
// }

// class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
//   VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());

//   String? email;

//   StatusRequest statusRequest = StatusRequest.none ;

//   @override
//   checkCode() {}

//   @override
//   goToSuccessSignUp(verfiyCodeSignUp) async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var response =
//         await verifyCodeSignUpData.postdata(email!, verfiyCodeSignUp);
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         Get.offNamed(AppRoute.successSignUp);
//       } else {
//         Get.defaultDialog(
//             title: "ُWarning",
//             middleText: " Verify Code Not Correct");
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   reSend(){
//     verifyCodeSignUpData.resendData(email!);
//   }

//   @override
//   void onInit() {
//     email = Get.arguments['email'];
//     super.onInit();
//   }
// }
