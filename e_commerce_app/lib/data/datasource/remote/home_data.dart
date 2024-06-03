
import 'package:e_commerce_app/core/class/crudrequest.dart';
import 'package:e_commerce_app/linkapi.dart';

class HomeData{

  Crud crud ;

  HomeData(this.crud);

  getData()async{

    var response =await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);

  }

    searchData(String search)async{

    var response =await crud.postData(AppLink.searchitems, {"search": search });
    return response.fold((l) => l, (r) => r);

  }
}