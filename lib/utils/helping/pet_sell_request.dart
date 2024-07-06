import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/utils/helping/help.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class PetSellRequest {
  static Future<dynamic> getPetsOnSell(
      int page, int limit, BuildContext context) async {
    try {
      var isInternet = await Helping.checkConnection();
      if (!isInternet) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("No Internet is connected"),
          backgroundColor: DoctorColor.red,
        ));
        return null;
      }

      final userId = await Helping.getToken("id");
      final token = await Helping.getToken("token");
      final formData = {
        "page": page + 1,
        "limit": limit,
      };

      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final url =
          Uri.parse("http://192.168.0.14:8080/mobile/api/sell/list/${userId}");
      final response =
          await http.post(url, headers: headers, body: jsonEncode(formData));
      final data = jsonDecode(response.body);

      return data;
    } catch (error) {
      print("error: $error");
      return null;
    }
  }

  static Future<dynamic> postingPetOnSell(String petId, String contactNo,
      String price, BuildContext context) async {
    try {
      var isInternet = await Helping.checkConnection();
      if (!isInternet) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("No Internet is connected"),
          backgroundColor: DoctorColor.red,
        ));
        return null;
      }

      final userId = await Helping.getToken("id");
      final token = await Helping.getToken("token");
      final formData = {
        "userId": userId,
        "petId": petId,
        "price": double.parse(price),
        "contactNo": contactNo,
      };

      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final url = Uri.parse("http://192.168.0.14:8080/mobile/api/sell/");
      final response =
          await http.post(url, headers: headers, body: jsonEncode(formData));
      final data = jsonDecode(response.body);
      return data;
    } catch (error) {
      print("error: $error");
      return null;
    }
  }
}
