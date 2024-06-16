import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vetner360/controller/doctor-location.dart';

class LocationPicker extends StatelessWidget {
  final locationController = Get.put(DoctorLocationController);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorLocationController>(
      init: DoctorLocationController("get-location"),
      builder: (_) => Stack(
        children: [
          Obx(
            () => GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(_.latitude.value, _.longitude.value),
                zoom: 2,
              ),
              trafficEnabled: true,
              onTap: (LatLng tapDown) {
                _.handleTap(tapDown);
              },
              markers: _.markersState.map((marker) => marker).toSet(),
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _.googleController.complete(controller);
              },
            ),
          ),
        ],
      ),
    );
  }
}
