import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vetner360/component/pet-owner-registration/index.dart';
import 'package:vetner360/globalclass/doctor_color.dart';
import 'package:vetner360/globalclass/doctor_fontstyle.dart';
import 'package:vetner360/globalclass/doctor_icons.dart';
import 'package:vetner360/pages/authentication/doctor_signin.dart';
import 'package:vetner360/theme/doctor_themecontroller.dart';

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
          // SingleChildScrollView(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //         horizontal: width / 36, vertical: height / 36),
          //     child: Column(
          //       children: [
          //         SizedBox(
          //           height: height / 24,
          //         ),
          //         SizedBox(
          //           height: height / 36,
          //         ),
          //         Text(
          //           "Create_Account".tr,
          //           style: isemibold.copyWith(fontSize: 20),
          //         ),
          //         SizedBox(
          //           height: height / 96,
          //         ),
          //         Text(
          //           "We_are_here_to_help_you".tr,
          //           style: iregular.copyWith(fontSize: 14),
          //         ),
          //         SizedBox(
          //           height: height / 26,
          //         ),

          // SizedBox(
          //   height: height / 26,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Container(
          //         height: height / 500,
          //         width: width / 2.85,
          //         color: DoctorColor.border),
          //     Text(
          //       "or".tr,
          //       style: imedium.copyWith(
          //           fontSize: 16, color: DoctorColor.textgrey),
          //     ),
          //     Container(
          //         height: height / 500,
          //         width: width / 2.85,
          //         color: DoctorColor.border),
          //   ],
          // ),
          // SizedBox(
          //   height: height / 36,
          // ),
          // Container(
          //   width: width / 1,
          //   height: height / 14,
          //   decoration: BoxDecoration(
          //       border: Border.all(color: DoctorColor.border),
          //       borderRadius: BorderRadius.circular(10)),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Image.asset(
          //         DoctorPngimage.google,
          //         height: height / 36,
          //       ),
          //       SizedBox(
          //         width: width / 26,
          //       ),
          //       Text(
          //         "Continue_with_Google".tr,
          //         style: imedium.copyWith(fontSize: 14),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: height / 56,
          // ),
          // Container(
          //   width: width / 1,
          //   height: height / 14,
          //   decoration: BoxDecoration(
          //       border: Border.all(color: DoctorColor.border),
          //       borderRadius: BorderRadius.circular(10)),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Image.asset(
          //         DoctorPngimage.facebook,
          //         height: height / 30,
          //       ),
          //       SizedBox(
          //         width: width / 26,
          //       ),
          //       Text(
          //         "Continue_with_Facebook".tr,
          //         style: imedium.copyWith(fontSize: 14),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: height / 36,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       "Do_you_have_anaccount".tr,
          //       style: iregular.copyWith(fontSize: 14),
          //     ),
          //     SizedBox(
          //       width: width / 96,
          //     ),
          //     InkWell(
          //         splashColor: DoctorColor.transparent,
          //         highlightColor: DoctorColor.transparent,
          //         onTap: () {
          //           Navigator.push(context, MaterialPageRoute(
          //             builder: (context) {
          //               return const DoctorSignin();
          //             },
          //           ));
          //         },
          //         child: Text(
          //           "Sign_In".tr,
          //           style: imedium.copyWith(
          //               fontSize: 14, color: Colors.blue),
          //         )),
          //   ],
          // )
          // ],
          //   ),
          // ),
          // ),
        ));
  }
}
