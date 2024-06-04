import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Helping {
  static final storage = const FlutterSecureStorage();

  Future<void> saveToken(String name, String token) async {
    await storage.write(key: name, value: token);
  }

  Future<String?> getToken(String name) async {
    return await storage.read(key: name);
  }
}
