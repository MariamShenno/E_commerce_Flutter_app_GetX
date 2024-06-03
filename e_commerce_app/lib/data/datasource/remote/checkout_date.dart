
import 'package:e_commerce_app/core/class/crudrequest.dart';
import 'package:e_commerce_app/linkapi.dart';

class CheckoutData {

  Crud crud ;

  CheckoutData(this.crud);

  checkout(Map data)async{

    var response =await crud.postData(AppLink.checkout, data);
    return response.fold((l) => l, (r) => r);

  }
}