import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToPageLogin();
 
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToPageLogin() {
   Get.offAll(AppRoute.login);
  }
  
 
}
