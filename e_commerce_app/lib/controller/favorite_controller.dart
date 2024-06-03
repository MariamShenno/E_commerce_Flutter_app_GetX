import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';
import '../core/functions/handlingdata.dart';

class FavoriteController  extends GetxController{

Map isFavorite = {};
List data = [];
late StatusRequest statusRequest;
Myservices myservices= Get.find();
FavoriteData favoriteData  = FavoriteData(Get.find());

// key -> id items 
// value -> 1 or 0

setFavorite (id, val){
isFavorite [id] = val ;
update();

}

  addFavorite(String itemsid) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorit(
    myservices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    //star backend
    if(StatusRequest.success == statusRequest){
      if(response ['status' == "success"]){
       // data.addAll(response ['data']);
        Get.rawSnackbar(
          messageText: const Text("تم إضافة المنتج للمفضلة"),
        );
      } else{
        statusRequest = StatusRequest.failure;
      }
   // end
    }
  }

  removeFavorite( String itemsid)async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorit(
    myservices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    //star backend
    if(StatusRequest.success == statusRequest){
      if(response ['status' == "success"]){
      //  data.addAll(response ['data']);
        Get.rawSnackbar(
          messageText: const Text("تم حذف المنتج للمفضلة"),
        );
      } else{
        statusRequest = StatusRequest.failure;
      }
   // end
    }
  }


}