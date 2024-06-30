import 'package:vetner360/component/pet-owner-registration/pet_owner_registration.dart';
import 'package:vetner360/component/doctor-registration/doctor_registration.dart';
import 'package:vetner360/component/guest-registration/index.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/controller/signup_controller.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                          "Buyer".tr,
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
