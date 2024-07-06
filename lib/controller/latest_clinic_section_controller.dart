import 'package:flutter/material.dart';
import 'package:vetner360/utils/helping/home_request.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:get/get.dart';

class LatestClinicSectionController extends GetxController {
  final themedata = Get.put(DoctorThemecontroler());
  RxList clinicList = [].obs;
  final img2 = DoctorPngimage.m1;
  final String name = "Sunrise Health Clinic";

  LatestClinicSectionController(BuildContext context) {
    setClinics(context);
  }

  Future<void> setClinics(BuildContext context) async {
    try {
      final List data = await HomePannelRequest.getLatestClinic(context);
      clinicList.value = data;
    } catch (error) {
      print("error: $error");
    }
  }
}
