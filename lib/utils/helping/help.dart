import 'dart:convert';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Helping {
  static final storage = const FlutterSecureStorage();

  static Future<void> saveToken(String name, String token) async {
    await storage.write(key: name, value: token);
  }

  static Future<String?> getToken(String name) async {
    return await storage.read(key: name);
  }

  static Future<bool> checkForAuth() async {
    try {
      final token = await getToken("token");
      if (token != null && token.length > 0) {
        return true;
      }
      return false;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  static Future<Uint8List> getBytesFromFile(XFile image) async {
    final bytes = await image.readAsBytes();
    return bytes;
  }

  static Future<String> getBase64Image(XFile image) async {
    final bytes = await image.readAsBytes();
    return base64Encode(bytes);
  }

  static Future<String> getAddress(LatLng location) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);

    if (placemarks.isNotEmpty) {
      final placemark = placemarks.first;
      String address =
          '${placemark.street}, ${placemark.locality} ${placemark.country}';
      return address;
    }
    return "";
  }

  static Future<bool> checkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }

    return false;
  }
}
