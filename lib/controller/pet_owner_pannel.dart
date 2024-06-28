import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:vetner360/theme/themecontroller.dart';

class PetOwnerPannelController extends GetxController {
  final themedata = Get.put(DoctorThemecontroler());
  var pageController = PageController();
  var selectedIndex = 0;

  List img = [
    DoctorPngimage.c,
    DoctorPngimage.c2,
    DoctorPngimage.c3,
    DoctorPngimage.c4,
  ];

  List petTypes = [
    "Cat",
    "Dog",
    "Horse",
    "Cow",
    "Goat",
  ];

  List img2 = [
    DoctorPngimage.m1,
    DoctorPngimage.m2,
    DoctorPngimage.m1,
    DoctorPngimage.m2,
  ];

  List name = [
    "Sunrise Health Clinic",
    "Golden Cardiology Center",
    "Sunrise Health Clinic",
    "Golden Cardiology Center"
  ];
}
