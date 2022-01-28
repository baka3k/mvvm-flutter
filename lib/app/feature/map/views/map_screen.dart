import 'dart:async';

import 'package:base_source/app/feature/map/viewmodels/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends GetWidget<MapViewModel> {
  @override
  MapViewModel get controller => Get.put(MapViewModel());
  final Completer<GoogleMapController> _mapController = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return GoogleMap(
          polylines: Set<Polyline>.of(controller.polylines.values),
          mapType: MapType.hybrid,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _mapController.complete(controller);
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController googleMapController = await _mapController.future;
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    controller.directionTest();
  }
}
