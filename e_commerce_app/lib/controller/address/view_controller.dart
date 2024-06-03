
import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/address_data.dart';
import '../../data/model/addressmodel.dart';



class AddressViewController  extends GetxController{

  AddressData addressData = AddressData(Get.find());
  List <AddressModel> data = [];

  late StatusRequest statusRequest;
  Myservices myservices = Get.find();


  deleteAddress(String addressid){
addressData.deleteData(addressid);
data.removeWhere((element) => element.addressId == addressid);
update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData.getData(
      myservices.sharedPreferences.getString("id")!
    );
    statusRequest = handlingData(response);

    if(StatusRequest.success == statusRequest){
      // start backend
      if(response ['status' == "success"]){
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        if(data.isEmpty){
          statusRequest = StatusRequest.failure;
        }
      } else{
        statusRequest = StatusRequest.failure;
      }
   
    }

    update();
  }

  @override
  void onInit() {
    getData() ;
    super.onInit();
  }
}