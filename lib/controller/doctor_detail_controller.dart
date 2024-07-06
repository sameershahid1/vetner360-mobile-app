import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vetner360/utils/helping/help.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:get/get.dart';

class DoctorDetailController extends GetxController {
  RxString address = "".obs;
  final themedata = Get.put(DoctorThemecontroler());

  DoctorDetailController(LatLng location) {
    Helping.getAddress(location).then((String address) {
      this.address.value = address;
    });
  }
}
