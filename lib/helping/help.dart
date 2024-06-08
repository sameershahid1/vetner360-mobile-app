import 'dart:convert';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Helping {
  static final storage = const FlutterSecureStorage();

  Future<void> saveToken(String name, String token) async {
    await storage.write(key: name, value: token);
  }

  Future<String?> getToken(String name) async {
    return await storage.read(key: name);
  }

  Future<bool> checkForAuth() async {
    try {
      final token = await this.getToken("token");
      if (token != null && token.length > 0) {
        return true;
      }
      return false;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  Future<Uint8List> getBytesFromFile(XFile image) async {
    final bytes = await image.readAsBytes();
    return bytes;
  }

  Future<String> getBase64Image(XFile image) async {
    final bytes = await image.readAsBytes();
    return base64Encode(bytes);
  }
}
