import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/utils/helping/help.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class HomePannelRequest {
  static Future<List> getLatestClinic(BuildContext context) async {
    try {
      var isInternet = await Helping.checkConnection();
      if (!isInternet) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("No Internet is connected"),
          backgroundColor: DoctorColor.red,
        ));
        return [];
      }

      final formData = {
        "page": 1,
        "limit": 10,
      };
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      final url =
          Uri.parse("http://192.168.0.14:8080/mobile/api/doctor/latest/clinic");
      final response =
          await http.post(url, headers: headers, body: jsonEncode(formData));

      final data = jsonDecode(response.body);
      return data['records'];
    } catch (error) {
      print("error: $error");
      return [];
    }
  }

  static Future<List> getLatestSellPet(
      int page, int limit, String? search, BuildContext context) async {
    try {
      var isInternet = await Helping.checkConnection();
      if (!isInternet) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("No Internet is connected"),
          backgroundColor: DoctorColor.red,
        ));
        return [];
      }
      var formData = {};
      if (search != null) {
        formData = {
          "page": page + 1,
          "limit": limit,
          "search": search,
        };
      } else {
        formData = {
          "page": page + 1,
          "limit": limit,
        };
      }
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      final url =
          Uri.parse("http://192.168.0.14:8080/mobile/api/pet/latest/all");
      final response =
          await http.post(url, headers: headers, body: jsonEncode(formData));

      final data = jsonDecode(response.body);
      return data['records'];
    } catch (error) {
      print("error: $error");
      return [];
    }
  }
}
