import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetner360/component/edit-doctor-profile/edit_doctor_profile.dart';
import 'package:vetner360/component/edit-user-profile/edit_user_profile.dart';
import 'package:vetner360/helping/help.dart';
import 'package:vetner360/theme/themecontroller.dart';

class EditProfileController extends GetxController {
  final themedata = Get.put(DoctorThemecontroler());
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final passwordController = TextEditingController();
  RxInt editProfileType = 0.obs;
  final editProfileWidgetList = [
    EditUserProfile(),
    EditDoctorProfile(),
  ];

  EditProfileController() {
    setEditProfileWidget();
  }

  Future<void> setEditProfileWidget() async {
    try {
      final String? roleType = await Helping.getToken("type");
      if (roleType != null) {
        editProfileType.value = int.parse(roleType) - 0;
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> updateUserProfile() async {
    try {
      //Update User Profile
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> updateDoctorProfile() async {
    try {
      //Update Doctor Profile
    } catch (e) {
      print("Error: $e");
    }
  }
}
