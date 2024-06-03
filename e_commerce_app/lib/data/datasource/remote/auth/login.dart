
import 'package:e_commerce_app/core/class/crudrequest.dart';

import '../../../../linkapi.dart';

class LoginData{
  Crud crud;
  LoginData(this.crud);
  postdata( String password, String email) async{
var response = await crud.postData(AppLink.login, {
"password": password,
"email": email,


});
return response.fold((l) => l, (r) => r);
  } 
}