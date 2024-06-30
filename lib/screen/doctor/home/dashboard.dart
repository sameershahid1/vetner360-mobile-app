import 'package:vetner360/controller/doctor_dashboard_controller.dart';
import 'package:vetner360/controller/guest_dashboard_controller.dart';
import 'package:vetner360/controller/pet_owner_dashboard_controller.dart';
import 'package:vetner360/controller/doctor_drawer.dart';
import '../../../theme/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorDashboardController>(
      init: DoctorDashboardController(context),
      builder: (_) => WillPopScope(
        onWillPop: () => _.onbackpressed(context),
        child: GetBuilder<DoctorThemecontroler>(builder: (controller) {
          return Obx(() => Scaffold(
                key: _.scaffoldKey,
                drawer: const DoctorDrawer(),
                bottomNavigationBar: _.bottomTabBar(),
                body: _.pages[_.selectedItemIndex.value],
              ));
        }),
      ),
    );
  }
}
