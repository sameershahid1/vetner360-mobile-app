import 'dart:convert';
import 'package:vetner360/helping/help.dart';
import 'package:http/http.dart' as http;

class Request {
  Future<List> getMyPet(int page, int limit) async {
    try {
      final formData = {
        "page": page + 1,
        "limit": limit,
      };
      final userId = await Helping().getToken("id");
      final token = await Helping().getToken("token");
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final url =
          Uri.parse("http://192.168.0.14:8080/mobile/api/pet/my-pet/${userId}");
      final response =
          await http.post(url, headers: headers, body: jsonEncode(formData));
      final data = jsonDecode(response.body);
      return data['records'];
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<dynamic> deletePet(String id, String? userId) async {
    final token = await Helping().getToken("token");
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    final url =
        Uri.parse("http://192.168.0.14:8080/mobile/api/pet/${userId}/${id}");
    final response = await http.delete(url, headers: headers);
    final data = jsonDecode(response.body);
    return data;
  }
}
