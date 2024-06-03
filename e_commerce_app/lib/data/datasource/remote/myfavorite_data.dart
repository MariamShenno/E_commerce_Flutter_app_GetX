
import 'package:e_commerce_app/core/class/crudrequest.dart';
import 'package:e_commerce_app/linkapi.dart';

class MyFavoriteData {

  Crud crud ;

  MyFavoriteData (this.crud);

  getData(String id)async{

    var response =await crud.postData(AppLink.favoriteView, {"id" : id});
    return response.fold((l) => l, (r) => r);

  }

    deleteData(String id)async{

    var response =await crud.postData(AppLink.deletefromfavroite, {"id" : id});
    return response.fold((l) => l, (r) => r);

  }
}