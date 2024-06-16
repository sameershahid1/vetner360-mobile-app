import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

class PetOwnerRegistrationController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();
  final themedata = Get.put(DoctorThemecontroler());

  String? validatePasswordMatch(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null; // No error message, so it's valid
  }

  void showErrorSnackBar(
      GlobalKey<ScaffoldMessengerState> key, String message) {
    key.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> registerAccount(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        final formData = {
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          "email": emailController.text,
          "phoneNo": phoneNoController.text,
          "password": passwordController.text,
          "userType": 1,
        };

        final url =
            Uri.parse("http://192.168.0.14:8080/mobile/api/user-registration");

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
          Navigator.pop(context);
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }
}
