import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vetner360/controller/doctor-location.dart';

class DoctorNearestLocation extends StatelessWidget {
  const DoctorNearestLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorLocationController>(
      init: DoctorLocationController("doc-location-list"),
      builder: (_) => Stack(
        children: [
          Obx(
            () => GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(_.latitude.value, _.longitude.value),
                zoom: 2,
              ),
              trafficEnabled: true,
              myLocationEnabled: true,
              markers: _.markersState.map((marker) => marker).toSet(),
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
