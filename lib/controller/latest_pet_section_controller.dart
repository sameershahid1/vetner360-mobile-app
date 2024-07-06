import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:vetner360/utils/helping/home_request.dart';

class LatestPetSectionController extends GetxController {
  final themedata = Get.put(DoctorThemecontroler());
  final img2 = DoctorPngimage.m1;
  RxList latestPet = [].obs;

  final String name = "Sunrise Health Clinic";

  LatestPetSectionController(BuildContext context) {
    HomePannelRequest.getLatestSellPet(0, 6, null, context).then((response) {
      latestPet.addAll(response);
    });
  }
}
