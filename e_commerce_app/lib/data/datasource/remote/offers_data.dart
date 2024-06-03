
import 'package:e_commerce_app/core/class/crudrequest.dart';
import 'package:e_commerce_app/linkapi.dart';

class OfferData {

  Crud crud ;

  OfferData(this.crud);

  getData()async{

    var response =await crud.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r);

  }
}