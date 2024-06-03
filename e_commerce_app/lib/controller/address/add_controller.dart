import 'dart:async';

import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  Completer<GoogleMapController>? completercontroller;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];

  double? lat ;
  double? long;

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(
      markerId: MarkerId("1"),
      position: latLng,
      ),
      );
      lat = latLng.latitude;
      long = latLng.longitude;
    update();
  }

  goToPageDetailsAddress(){
    Get.toNamed(AppRoute.addressadddetails , arguments: {
"lat":lat.toString(),
"long":long.toString(),

    },
    );
  }

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;

    addMarkers(LatLng (position!.latitude, position!.longitude));

    update();
  }

  

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
