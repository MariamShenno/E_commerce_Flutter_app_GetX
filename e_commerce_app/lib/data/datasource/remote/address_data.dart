import 'package:e_commerce_app/linkapi.dart';

import '../../../core/class/crudrequest.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.addresstview, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  addData(String usersid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(
      AppLink.addressAdd,
      {
        "usersid": usersid,
        "name": name,
        "city": city,
        "street": street,
        "lat": lat,
        "long": long,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String usersid) async {
    var response =
        await crud.postData(AppLink.addressDelete, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
