import 'dart:async';

import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class DoctorLocationController extends GetxController {
  final Completer<GoogleMapController> googleController =
      Completer<GoogleMapController>().obs();
  final RxList<Marker> markersState = RxList([]);
  RxDouble latitude = RxDouble(0);
  RxDouble longitude = RxDouble(0);

  DoctorLocationController(String type) {
    this.setCurrentLocation(type);
    if (type == "doc-location-list") {
      setDoctorList();
    }
  }

  Future<void> setDoctorList() async {
    print("Send Request");
  }

  Future<bool> _requestLocationPermission() async {
    var locationStatus = await Permission.location.status;
    if (locationStatus.isGranted) {
      return true;
    } else if (locationStatus.isDenied) {
      var requestResult = await Permission.location.request();
      if (requestResult == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  Future<Position?> _getCurrentLocation() async {
    bool hasPermission = await _requestLocationPermission();
    if (!hasPermission) {
      return null;
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return position;
    } catch (e) {
      print("Error getting location: $e");
      return null;
    }
  }

  Future<void> setCurrentLocation(String type) async {
    Position? position = await _getCurrentLocation();

    if (position != null) {
      this.latitude.value = position.latitude;
      this.longitude.value = position.longitude;
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      final GoogleMapController controller = await googleController.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(position.latitude, position.longitude),
              tilt: 59.440717697143555,
              zoom: 19.151926040649414)));

      if (placemarks.isNotEmpty && type == "get-location") {
        final placemark = placemarks.first;
        String address = '${placemark.street}, '
            '${placemark.subLocality} ${placemark.locality},'
            '${placemark.postalCode} ${placemark.country}';
        this.markersState.clear();
        this.markersState.add(Marker(
              markerId: MarkerId('doctor-clinic-location'),
              position: LatLng(position.latitude, position.longitude),
              infoWindow: InfoWindow(title: "$address"),
            ));
      }
    } else {
      print(position);
    }
  }

  Future<void> setMarkerOnTap(LatLng tapPosition) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        tapPosition.latitude, tapPosition.longitude);

    if (placemarks.isNotEmpty) {
      this.latitude.value = tapPosition.latitude;
      this.longitude.value = tapPosition.longitude;
      final placemark = placemarks.first;

      String address = '${placemark.street}, '
          '${placemark.subLocality} ${placemark.locality}, '
          '${placemark.postalCode} ${placemark.country}';

      this.markersState.clear();
      this.markersState.add(Marker(
            markerId: MarkerId('doctor-clinic-location'),
            position: tapPosition,
            infoWindow: InfoWindow(title: "$address"),
          ));
    }
  }

  void handleTap(LatLng tapPosition) {
    setMarkerOnTap(tapPosition);
  }
}
