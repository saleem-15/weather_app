import 'dart:developer';
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as android_location;

Future<List<double>> getLocation() async {
  if (Platform.isAndroid) {
    androidLocation();
  }

  bool isServiceEnabled;
  LocationPermission locationPermission;

  isServiceEnabled = await Geolocator.isLocationServiceEnabled();
// return if service is not enabled
  if (!isServiceEnabled) {
    return Future.error("Location not enabled");
  }

  // status of permission
  locationPermission = await Geolocator.checkPermission();

  if (locationPermission == LocationPermission.deniedForever) {
    return Future.error("Location permission are denied forever");
  } else if (locationPermission == LocationPermission.denied) {
    //  request permission
    locationPermission = await Geolocator.requestPermission();
  }

  // getting the currentposition
  final position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.lowest,
  );

  return [position.latitude, position.longitude];
}

Future<void> androidLocation() async {
  android_location.Location location = android_location.Location();

  bool serviceEnabled;
  android_location.PermissionStatus permissionGranted;
  android_location.LocationData locationData;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      throw 'Service not enabled';
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == android_location.PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != android_location.PermissionStatus.granted) {}
  }

  locationData = await location.getLocation();
  log(locationData.latitude.toString());
  log(locationData.longitude.toString());
}

/*
 void getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
// return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    // status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      //  request permission
      locationPermission = await Geolocator.requestPermission();
    }

    // getting the currentposition
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
// update our lattitude and longitude
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;
    });
  }

*/