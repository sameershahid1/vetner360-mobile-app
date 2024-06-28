import 'package:flutter/material.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/helping/help.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Request {
  Future<List> getMyPet(int page, int limit, BuildContext context) async {
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
        "page": page + 1,
        "limit": limit,
      };
      final userId = await Helping.getToken("id");
      final token = await Helping.getToken("token");
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final url = Uri.parse(
          "http://vetner360.koyeb.app/mobile/api/pet/my-pet/${userId}");
      final response =
          await http.post(url, headers: headers, body: jsonEncode(formData));
      final data = jsonDecode(response.body);
      return data['records'];
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<dynamic> deletePet(
      String id, String? userId, BuildContext context) async {
    var isInternet = await Helping.checkConnection();
    if (!isInternet) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("No Internet is connected"),
        backgroundColor: DoctorColor.red,
      ));
      return [];
    }

    final token = await Helping.getToken("token");
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    final url =
        Uri.parse("http://vetner360.koyeb.app/mobile/api/pet/${userId}/${id}");
    final response = await http.delete(url, headers: headers);
    final data = jsonDecode(response.body);
    return data;
  }

  Future<List> getMyPetActivity(
      int page, int limit, String petId, BuildContext context) async {
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
        "page": page + 1,
        "limit": limit,
      };
      final token = await Helping.getToken("token");
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final url = Uri.parse(
          "http://vetner360.koyeb.app/mobile/api/pet/activity/list/${petId}");
      final response =
          await http.post(url, headers: headers, body: jsonEncode(formData));
      final data = jsonDecode(response.body);
      return data['records'];
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<dynamic> deletePetActivity(String id, String petId) async {
    final token = await Helping.getToken("token");
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    final url =
        Uri.parse("http://vetner360.koyeb.app/mobile/api/pet/${petId}/${id}");
    final response = await http.delete(url, headers: headers);
    final data = jsonDecode(response.body);
    return data;
  }
}
