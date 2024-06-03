
import 'package:e_commerce_app/core/class/crudrequest.dart';

import '../../../../linkapi.dart';

class ResetPasswordData{
  Crud crud;
  ResetPasswordData(this.crud);
  postdata( String password, String email) async{
var response = await crud.postData(AppLink.resetPassword, {
"password": password,
"email": email,


});
return response.fold((l) => l, (r) => r);
  }
}