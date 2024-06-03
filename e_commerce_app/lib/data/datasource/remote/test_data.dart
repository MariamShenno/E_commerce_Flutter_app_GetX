
import 'package:e_commerce_app/core/class/crudrequest.dart';
import 'package:e_commerce_app/linkapi.dart';

class TestData {

  Crud crud ;

  TestData(this.crud);

  getData()async{

    var response =await crud.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);

  }
}