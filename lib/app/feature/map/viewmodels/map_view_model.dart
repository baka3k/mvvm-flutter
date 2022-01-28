import 'package:base_source/app/base/base_viewmodel.dart';
import 'package:base_source/app/feature/map/secrets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show cos, sqrt, asin;

double _coordinateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

class MapViewModel extends BaseViewModel {
  late PolylinePoints _polylinePoints;

  // List of coordinates to join
  final List<LatLng> _polylineCoordinates = [];

  // Map storing polylines created by connecting two points
  final Map<PolylineId, Polyline> _polylines = <PolylineId, Polyline>{}.obs;

  Map<PolylineId, Polyline> get polylines => _polylines;

  PolylinePoints get polylinePoints => _polylinePoints;

  List<LatLng> get polylineCoordinates => _polylineCoordinates;

  direction(PointLatLng origin, PointLatLng destination) async {
    _polylineCoordinates.clear();
    PolylinePoints polylinePoints = PolylinePoints();
    // Generating the list of coordinates to be used for
    // drawing the polylines
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Secrets.API_KEY, // Google Maps API Key
      origin,
      destination,
      travelMode: TravelMode.transit,
    );
    // Adding the coordinates to the list
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        _polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }

    // Defining an ID
    PolylineId id = const PolylineId('poly');

    // Initializing Polyline
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: _polylineCoordinates,
      width: 3,
    );
    // Adding the polyline to the map
    _polylines[id] = polyline;
    // update();
  }

  double totalDistance = 0.0;

  caculateTest() {
    // Calculating the total distance by adding the distance
    // between small segments
    totalDistance = 0;
    for (int i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += _coordinateDistance(
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
    }
    var _placeDistance = totalDistance.toStringAsFixed(2);
    print('DISTANCE: $_placeDistance km');
  }

  directionTest() async {
     await direction(const PointLatLng(37.42796133580664, -122.085749655962),
        const PointLatLng(37.43296265331129, -122.08832357078792));
    caculateTest();
  }
}
