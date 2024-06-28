import 'package:get/get_rx/get_rx.dart';
import 'package:vetner360/controller/doctor_location.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/helping/help.dart';
import 'package:vetner360/screen/authentication/location-picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:vetner360/theme/themecontroller.dart';

class DoctorRegistrationController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final fatherNameController = TextEditingController();
  final registrationController = TextEditingController();
  final clinicNameController = TextEditingController();
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();
  final themedata = Get.put(DoctorThemecontroler());
  RxDouble latitude = RxDouble(0);
  RxDouble longitude = RxDouble(0);

  String? validatePasswordMatch(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
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

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Clinic Location'),
          content: LocationPicker(),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                final doctorLocationController =
                    Get.find<DoctorLocationController>();

                this.longitude.value = doctorLocationController.longitude.value;
                this.latitude.value = doctorLocationController.latitude.value;
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> createAccount(BuildContext context) async {
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
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          "email": emailController.text,
          "phoneNo": phoneNoController.text,
          "password": passwordController.text,
          "fatherName": fatherNameController.text,
          "registration": registrationController.text,
          "clinicName": clinicNameController.text,
          "longitude": this.longitude.value,
          "latitude": this.latitude.value,
          "userType": 3,
        };

        final url = Uri.parse(
            "http://vetner360.koyeb.app/mobile/api/doctor-registration");

        final response = await http.post(url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(formData));
        final data = jsonDecode(response.body);
        Color bgColor;
        if (response.statusCode != 200) {
          bgColor = Colors.red;
        } else {
          bgColor = Colors.green;
          Navigator.pop(context);
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(data['message']),
          backgroundColor: bgColor,
        ));
      } catch (e) {
        print('Error: $e');
      }
    }
  }
}
