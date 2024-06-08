import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vetner360/component/pet-owner-registration/index.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/theme/themecontroller.dart';

class DoctorSignup extends StatefulWidget {
  const DoctorSignup({Key? key}) : super(key: key);

  @override
  State<DoctorSignup> createState() => _DoctorSignupState();
}

class _DoctorSignupState extends State<DoctorSignup> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            surfaceTintColor: DoctorColor.white,
            title: Text(
              "Create_Account".tr,
              style: isemibold.copyWith(
                  fontSize: 20,
                  color:
                      themedata.isdark ? DoctorColor.white : DoctorColor.black),
            ),
            bottom: TabBar(
                unselectedLabelStyle: isemibold.copyWith(
                  color: DoctorColor.grey,
                  fontSize: 16,
                ),
                labelStyle: isemibold.copyWith(
                    fontSize: 16,
                    color: themedata.isdark
                        ? DoctorColor.white
                        : DoctorColor.black),
                indicatorColor:
                    themedata.isdark ? DoctorColor.white : DoctorColor.black,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Text(
                      "Pet Owner".tr,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Guest".tr,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Doctor".tr,
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 36, vertical: height / 36),
              child: PetOwnerRegistration(),
            )),
            SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 36, vertical: height / 36),
              child: PetOwnerRegistration(),
            )),
            SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 36, vertical: height / 36),
              child: PetOwnerRegistration(),
            )),
          ]),
        ));
  }
}
