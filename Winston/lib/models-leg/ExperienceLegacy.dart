import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geodesy/geodesy.dart' as geo;

import 'package:winston/models/Beacon.dart';
import 'package:winston/models/Payload.dart';
import '../utils/ExperienceLoader.dart';

ExperienceLoader loader = new ExperienceLoader();

class Experience extends ChangeNotifier {

  String id = '';
  String name = 'No Experience Loaded';
  String description = 'Go to the Download Page to scan a QR code and start a trail';
  String variables = '';
  BitmapDescriptor _markerIcon;

  Payload currentPayload;
  List<Beacon> beacons = [];
  List<Payload> payloads = [];
  Set<Marker> markers; 

  List<bool> previousHitList = [];

  Experience () {
    
  }

  Future<void> load (url) async{
    
    await loader.fetch(url);
    
    if (loader.loadSuccess){
      this.setInfo(loader.getInfo());
      this.beacons = loader.getBeacons();
      this.payloads = loader.getPayloads();
      //this.markers = this.getMarkers();
      this.initPreviousHitList();

      notifyListeners();
    }else{
      print("Error loading the data");
    }
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context, size: Size.square(98));
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'assets/images/pin.png')
          .then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    _markerIcon = bitmap;
    notifyListeners();
  }

  Set<Marker> getMarkers (context) {
    
    _createMarkerImageFromAsset(context);

    if (beacons.length == 0) return null;
    Set<Marker> markers = new Set<Marker>();
    
    int count = 0;

    for (Beacon beacon in beacons) {
      
      count++;

      if (beacon.type == "GPS"){
        
        Marker m = new Marker(
          markerId: MarkerId("index-" + count.toString()),
          position: new LatLng(beacon.lat, beacon.lng),
          icon: _markerIcon,
        );
        
        markers.add(m);
      }
    }
 
    return markers;
  }

  List<int> gpsBeaconPromimityCheck(currentLocation) {
    
    final geo.Distance distance = new geo.Distance();
    List<int> proximityList = <int>[];

    for (Beacon beacon in beacons) {
      int distanceInMeters = distance(currentLocation, new geo.LatLng(beacon.lat, beacon.lng)).floor();
      proximityList.add(distanceInMeters);
    }

    return proximityList;
  }

  // Only returns true when the user steps into a hit zone
  bool beaconHitCheck(currentLocation) {
    
    final geo.Distance distance = new geo.Distance();
    List<bool> currentHitList = <bool>[];

    bool triggerModalFlag = false;

    // get a list of current hits
    for (int i = 0; i < this.beacons.length; i++) {
      int distanceInMeters = distance(currentLocation, new geo.LatLng(this.beacons[i].lat, this.beacons[i].lng)).floor();
      bool current = (distanceInMeters <= this.beacons[i].accuracy);

      if (current != this.previousHitList[i] && current == true) triggerModalFlag = true;

      currentPayload = payloads[i];
      currentHitList.add(current);
    } 
    this.previousHitList = currentHitList; 
    return triggerModalFlag;
  }

  void initPreviousHitList() {
    for (int i = 0; i < this.beacons.length; i++){
      this.previousHitList.add(false);
    }
  }

  void setError() {
    this.setInfo([
      'N/A'
      'INVALID QR CODE',
      'Please try again. If the issue persists then get support from a member of the team',
      '']);
    this.beacons.clear(); 
    this.payloads.clear();
  }

  void setInfo(info){
    this.id = info[0];
    this.name = info[1];
    this.description = info[2];
    this.variables = info[3];   
  }

  List<double> getDistances () {
    List<double> distances = [];
  }
  
}