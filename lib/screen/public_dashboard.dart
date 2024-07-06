import 'package:vetner360/component/drawer/pet_owner_drawer.dart';
import 'package:vetner360/controller/pet_owner_dashboard_controller.dart';
import 'package:vetner360/controller/public_dashboard_controller.dart';
import '../../../theme/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicDashboard extends StatelessWidget {
  const PublicDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicDashboardController>(
      init: PublicDashboardController(context),
      builder: (_) => WillPopScope(
        onWillPop: () => _.onbackpressed(context),
        child: GetBuilder<DoctorThemecontroler>(builder: (controller) {
          return Obx(() => Scaffold(
                key: _.scaffoldKey,
                bottomNavigationBar: _.bottomTabBar(),
                body: _.pages[_.selectedItemIndex.value],
              ));
        }),
      ),
    );
  }
}
