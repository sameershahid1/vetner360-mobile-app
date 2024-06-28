import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vetner360/helping/chat_request.dart';
import 'package:vetner360/screen/pet-owner/home/dashboard.dart';
import 'package:vetner360/screen/doctor/home/dashboard.dart';
import 'package:vetner360/screen/guest/home/dashboard.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/helping/help.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final themedata = Get.put(DoctorThemecontroler());
  final storage = const FlutterSecureStorage();

  Future<void> signAccount(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        var isInternet = await Helping.checkConnection();
        if (!isInternet) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("No Internet is connected"),
            backgroundColor: DoctorColor.red,
          ));
          return;
        }

        final formData = {
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
        };
        final url = Uri.parse("http://vetner360.koyeb.app/mobile/api/login");
        final response = await http.post(url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(formData));
        final data = jsonDecode(response.body);
        if (response.statusCode != 200) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(data['message']),
            backgroundColor: DoctorColor.red,
          ));
        } else {
          final token = data['token'];
          final userId = data['userId'];

          await Helping.saveToken("token", token);
          await Helping.saveToken("id", userId);

          switch (data['roleType']) {
            case 1:
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return PetOwnerDashboard();
                },
              ));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return GuestDashboard();
                },
              ));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DoctorDashboard();
                },
              ));
              break;
            default:
          }
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }
}
