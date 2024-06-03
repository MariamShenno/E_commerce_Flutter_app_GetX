
import 'package:e_commerce_app/core/class/crudrequest.dart';
import 'package:e_commerce_app/linkapi.dart';

class FavoriteData   {

  Crud crud ;

   FavoriteData (this.crud);

  addFavorit(String usersid, String itemsid)async{

    var response =await crud.postData(
      AppLink.favoriteAdd, 
      {"usersid": usersid, "itemsid" : itemsid}
      );
    return response.fold((l) => l, (r) => r);

  }

    removeFavorit(String usersid, String itemsid)async{

    var response =await crud.postData(
      AppLink.favoriteRemove, 
      {"usersid": usersid, "itemsid" : itemsid}
      );
    return response.fold((l) => l, (r) => r);

  }
}