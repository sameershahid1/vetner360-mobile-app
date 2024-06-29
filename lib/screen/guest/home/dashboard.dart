import 'package:vetner360/component/drawer/more_option_drawer.dart';
import 'package:vetner360/component/guest-drawer/guest_drawer.dart';
import 'package:vetner360/controller/guest_dashboard_controller.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuestDashboard extends StatelessWidget {
  const GuestDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuestDashboardController>(
      init: GuestDashboardController(context),
      builder: (_) => WillPopScope(
        onWillPop: () => _.onbackpressed(context),
        child: GetBuilder<DoctorThemecontroler>(builder: (controller) {
          return Obx(() => Scaffold(
                key: _.scaffoldKey,
                drawer: const GuestDrawer(),
                bottomNavigationBar: _.bottomTabBar(),
                body: _.pages[_.selectedItemIndex.value],
              ));
        }),
      ),
    );
  }
}
