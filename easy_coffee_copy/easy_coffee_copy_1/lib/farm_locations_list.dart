import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:easy_coffee_copy_1/map.dart';
Marker lumumba = Marker(
    markerId: MarkerId('test1'),
    position: LatLng(
      0.331944600617,
      32.5659497926,
    ),
    infoWindow: InfoWindow(title: 'lumumba 2'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet));

Marker Riis_Coffee_farm = Marker(
    markerId: MarkerId('test2'),
    position: LatLng(0.3113466, 33.0625123),
    infoWindow: InfoWindow(title: 'Riis coffee farm'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet));

Marker mbarara_farm = Marker(
    markerId: MarkerId('test3'),
    position: LatLng(-0.60460235698, 30.832564),
    infoWindow: InfoWindow(title: 'Mbarara coffee'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet));

Marker kabalagala_farm = Marker(
    markerId: MarkerId('test4'),
    position: LatLng(0.3521169, 31.80625123),
    infoWindow: InfoWindow(title: 'kamuli coffee ltd'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet));
