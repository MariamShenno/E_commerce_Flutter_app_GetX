import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;


Future<Set<Polyline>> getPolyLine(lat, long, deslat, deslong) async {

Set<Polyline> polylineSet = {};
List<LatLng> polylineco = [];
PolylinePoints polylinePoints = PolylinePoints();

  //create key by api google, Must be it addedd
  var url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$deslat,$deslong&key";

  var response = await http.post(Uri.parse(url));

  var responsebody = jsonDecode(response.body);

  var point = responsebody['routes'][0]['overview_polyline']['points'];

  List<PointLatLng> result = polylinePoints.decodePolyline(point);

  if (result.isNotEmpty) {
    result.forEach((PointLatLng pointLatLng) {
      polylineco.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    });
  }
// must be unique (PolylineId)
  Polyline polyline = Polyline(
      polylineId: PolylineId("Mariam"), color: Color(0xff3498db), width: 5, points:  polylineco);

  polylineSet.add(polyline);

  return polylineSet;
}
