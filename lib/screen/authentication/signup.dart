import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vetner360/component/doctor-registration/index.dart';
import 'package:vetner360/component/guest-registration/index.dart';
import 'package:vetner360/component/pet-owner-registration/index.dart';
import 'package:vetner360/controller/signup.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (_) => DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                surfaceTintColor: DoctorColor.white,
                title: Text(
                  "Create_Account".tr,
                  style: isemibold.copyWith(
                      fontSize: 20,
                      color: _.themedata.isdark
                          ? DoctorColor.white
                          : DoctorColor.black),
                ),
                bottom: TabBar(
                    unselectedLabelStyle: isemibold.copyWith(
                      color: DoctorColor.grey,
                      fontSize: 16,
                    ),
                    labelStyle: isemibold.copyWith(
                        fontSize: 16,
                        color: _.themedata.isdark
                            ? DoctorColor.white
                            : DoctorColor.black),
                    indicatorColor: _.themedata.isdark
                        ? DoctorColor.white
                        : DoctorColor.black,
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
              body: Column(
                children: [
                  Expanded(
                      child: TabBarView(children: [
                    PetOwnerRegistration(),
                    GuestRegistration(),
                    DoctorRegistration()
                  ])),
                ],
              ),
            )));
  }
}
