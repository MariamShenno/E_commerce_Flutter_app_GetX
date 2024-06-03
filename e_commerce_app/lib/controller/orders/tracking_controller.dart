import 'dart:async';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/polyline.dart';
import '../../data/model/ordersmodel.dart';

class TrackingController extends GetxController {

  GoogleMapController? gac;
  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;
  List<Marker> markers = [];
  CameraPosition? cameraPosition;
  double? destinationlat;
  double? destinationlong;
  double? currentlat;
  double? currentlong;
  Set<Polyline> polylineSet = {};
  Myservices myServices = Get.find();


  intialData() {
    cameraPosition = CameraPosition(
      target: LatLng(
        double.parse(ordersModel.addressLat!),
        double.parse(ordersModel.addressLong!),
      ),
      zoom: 12.4746,
    );
    markers.add(Marker(
        // user location
        markerId: MarkerId("Current"),
        position: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!))));
        markers.removeWhere((element) => element.markerId.value == "Current");
  }



initpolyline() async{
  destinationlat = double.parse(ordersModel.addressLat!);
  destinationlong = double.parse(ordersModel.addressLong!);
 await Future.delayed(Duration(seconds: 1));
polylineSet = await getPolyLine(currentlat, currentlong, destinationlat, destinationlong);
update();
}

getLocationdelivery(){
  FirebaseFirestore.instance.collection("delivery").doc(ordersModel.ordersId).snapshots().listen((event) {
    if(event.exists){
      destinationlat = event.get("lat");
      destinationlong = event.get("long");
      updateMarkerDelivery(destinationlat!, destinationlong!);
    }
  });
}

updateMarkerDelivery(double newlat, double newlong){
      // // delivery location
      markers.add(Marker(
          markerId: MarkerId("destination"),
          position: LatLng(newlat, newlong)));
          update();
}


  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    intialData();
    getLocationdelivery();
   // initpolyline();
    super.onInit();
  }

  @override
  void onClose() {
    gac!.dispose();
    super.onClose();
  }

// 1- Get Current Position
// 2- Tracking
}
