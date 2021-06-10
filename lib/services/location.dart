import 'package:geolocator/geolocator.dart';
import 'dart:async';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        print('Permission is not granted, asking for permission.');
        LocationPermission permission = await Geolocator.requestPermission();
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (err) {
      print('$err');
    }
  }
}