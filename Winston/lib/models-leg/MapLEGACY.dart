import 'dart:typed_data';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:flutter/services.dart';

class Map extends ChangeNotifier {

  static final CameraPosition initialPosition = const CameraPosition(
    target: LatLng(-33.852, 151.211),
    zoom: 11.0,
  );

  MapboxMapController mapController;
  CameraPosition position = initialPosition;
  bool telemetryEnabled = true;
  bool isMoving = false;

  Map ();
  
  void onMapChanged() {
    _extractMapInfo();
    notifyListeners();
  }

  void onMapCreated(MapboxMapController controller) {
    mapController = controller;
    mapController.addListener(this.onMapChanged);
    _extractMapInfo();
  }

  
  void _extractMapInfo() {
    if (mapController != null){
      position = mapController.cameraPosition;
      isMoving = mapController.isCameraMoving;
    }
  }

  void dispose() {
    mapController.removeListener(onMapChanged);
  }

}