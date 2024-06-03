import 'package:e_commerce_app/core/class/statusrequest.dart';


handlingData(response){
  if(response is StatusRequest){
    return response;
  } else{
    return StatusRequest.success;
  }
}