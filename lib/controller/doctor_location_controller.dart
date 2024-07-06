import 'package:vetner360/screen/pet-owner/nearest-location/doctor_detail.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vetner360/utils/helping/help.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:async';

class DoctorLocationController extends GetxController {
  final Completer<GoogleMapController> googleController =
      Completer<GoogleMapController>().obs();
  final RxList<Marker> markersState = RxList([]);
  RxDouble latitude = RxDouble(0);
  RxDouble longitude = RxDouble(0);

  DoctorLocationController(String type, BuildContext context) {
    this.setCurrentLocation(type);
    if (type == "doc-location-list") {
      loadDoctors(context);
    }
  }

  Future<void> loadDoctors(BuildContext context) async {
    try {
      Position? position = await _getCurrentLocation();
      if (position != null) {
        final token = await Helping.getToken("token");
        Map<String, String> headers = {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        };

        final url = Uri.parse(
            "http://vetner360.koyeb.app/mobile/api/doctor/nearest?latitude=${position.latitude}&longitude=${position.longitude}");
        final response = await http.get(url, headers: headers);
        final data = jsonDecode(response.body);
        Color bgColor;
        if (response.statusCode != 200) {
          bgColor = Colors.red;
        } else {
          bgColor = Colors.green;
          List doctorList = data['records'];
          doctorList.forEach((data) async {
            LatLng location = LatLng(data['location']['coordinates'][1],
                data['location']['coordinates'][0]);
            String address = await Helping.getAddress(location);
            this.markersState.add(Marker(
                  markerId: MarkerId('doctor-clinic-location-${data['id']}'),
                  position: location,
                  infoWindow: InfoWindow(
                    title: "${data['firstName']} ${data['lastName']}",
                    snippet: address,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DoctorDetails(detailInfo: data);
                        },
                      ));
                    },
                  ),
                ));
          });
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(data['message']),
          backgroundColor: bgColor,
        ));
      }
    } catch (e) {
      print('Error: $e');
    }
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

      final GoogleMapController controller = await googleController.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(position.latitude, position.longitude),
              tilt: 59.440717697143555,
              zoom: 19.151926040649414)));
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

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
