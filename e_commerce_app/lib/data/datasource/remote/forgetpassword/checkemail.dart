
import 'package:e_commerce_app/core/class/crudrequest.dart';

import '../../../../linkapi.dart';

class CheckEmailData{
  Crud crud;
  CheckEmailData(this.crud);
  postdata(String email) async{
var response = await crud.postData(AppLink.checkEmail, {

"email": email,


});
return response.fold((l) => l, (r) => r);
  }
}