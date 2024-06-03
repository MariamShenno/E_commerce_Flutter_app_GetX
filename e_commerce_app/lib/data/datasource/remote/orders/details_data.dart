import 'package:e_commerce_app/core/class/crudrequest.dart';
import 'package:e_commerce_app/linkapi.dart';


class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.ordersdetails, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}