import 'package:e_commerce_app/core/class/handlingdataview.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/address/add_controller.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController controllerpage = Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Address"),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      body: Container(
        child: GetBuilder<AddAddressController>(
          builder: (controllerpage) => HandlingDataRequest(
            statusRequest: controllerpage.statusRequest,
            widget: Column(
              children: [ 
                if (controllerpage.kGooglePlex != null)
                  Expanded(
                     child: Stack(
                      alignment: Alignment.center,
                       children: [
                         GoogleMap(
                          mapType: MapType.normal,
                          markers: controllerpage.markers.toSet(),
                          onTap: (LatLlng){
                            controllerpage.addMarkers(LatLlng);
                          },
                          initialCameraPosition: controllerpage.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controllerpage.completercontroller!
                                .complete(controllermap);
                          },
                    ),
                    Positioned(
                      bottom: 10,
                      child: Container(
                        child: MaterialButton(
                          minWidth: 200,
                          onPressed: (){},
                             color: ColorApp.primaryColor,
                             textColor:ColorApp.secondColor,
                          child: const Text(
                            "إكمال",
                             style: TextStyle(fontSize: 18),
                             ),
                          ),
                      ),
                    ),
                       ],
                     ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
