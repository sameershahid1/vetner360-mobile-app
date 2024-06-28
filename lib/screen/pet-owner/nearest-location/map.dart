import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vetner360/controller/doctor_location.dart';
import 'package:vetner360/screen/pet-owner/nearest-location/doctor_search.dart';

class DoctorNearestLocation extends StatelessWidget {
  const DoctorNearestLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorLocationController>(
      init: DoctorLocationController("doc-location-list", context),
      builder: (_) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const DoctorSearch();
              },
            ));
          },
          child: Icon(
            Icons.search,
            color: Colors.white,
            weight: 30,
          ),
          backgroundColor: Colors.blueAccent,
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniStartFloat,
        body: Stack(
          children: [
            Obx(
              () => GoogleMap(
                key: ValueKey("google"),
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
      ),
    );
  }
}
