import 'package:vetner360/component/drawer/more_option_drawer.dart';
import 'package:vetner360/controller/pet_owner_dashboard.dart';
import '../../../theme/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetOwnerDashboard extends StatelessWidget {
  const PetOwnerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PetOwnerDashboardController>(
      init: PetOwnerDashboardController(context),
      builder: (_) => WillPopScope(
        onWillPop: () => _.onbackpressed(context),
        child: GetBuilder<DoctorThemecontroler>(builder: (controller) {
          return Obx(() => Scaffold(
                key: _.scaffoldKey,
                drawer: const MoreOptionDrawer(),
                bottomNavigationBar: _.bottomTabBar(),
                body: _.pages[_.selectedItemIndex.value],
              ));
        }),
      ),
    );
  }
}
