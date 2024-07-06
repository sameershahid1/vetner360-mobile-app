import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:vetner360/utils/helping/help.dart';
import 'package:vetner360/screen/authentication/signin.dart';
import 'package:vetner360/screen/profile/cms.dart';
import 'package:vetner360/screen/profile/edit_profile.dart';
import 'package:vetner360/screen/profile/notification.dart';
import 'package:vetner360/theme/themecontroller.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  bool isdark = true;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: DoctorColor.white,
        title: Text(
          "Profile".tr,
          style: isemibold.copyWith(
              fontSize: 20,
              color: themedata.isdark ? DoctorColor.white : DoctorColor.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: DoctorColor.transparent,
                      backgroundImage: AssetImage(DoctorPngimage.profileimg),
                    ),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: height / 26,
                          width: height / 26,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  topLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5)),
                              color: themedata.isdark
                                  ? DoctorColor.white
                                  : DoctorColor.black),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(DoctorPngimage.edit,
                                height: height / 46,
                                color: themedata.isdark
                                    ? DoctorColor.black
                                    : DoctorColor.white),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: height / 46,
              ),
              Text(
                "Daniel Martinez".tr,
                style: ibold.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: height / 200,
              ),
              Text(
                "+123 856479683".tr,
                style: iregular.copyWith(
                    fontSize: 14, color: DoctorColor.textgrey),
              ),
              SizedBox(
                height: height / 36,
              ),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return EditProfile();
                    },
                  ));
                },
                child: Row(
                  children: [
                    Image.asset(
                      DoctorPngimage.useredit,
                      height: height / 36,
                      color: themedata.isdark
                          ? DoctorColor.white
                          : DoctorColor.black,
                    ),
                    SizedBox(
                      width: width / 26,
                    ),
                    Text(
                      "Edit_Profile".tr,
                      style: iregular.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: height / 46,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 120,
              ),
              const Divider(),
              SizedBox(
                height: height / 120,
              ),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const DoctorNotification();
                    },
                  ));
                },
                child: Row(
                  children: [
                    Image.asset(
                      DoctorPngimage.icnotification,
                      height: height / 36,
                      color: themedata.isdark
                          ? DoctorColor.white
                          : DoctorColor.black,
                    ),
                    SizedBox(
                      width: width / 26,
                    ),
                    Text(
                      "Notifications".tr,
                      style: iregular.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: height / 46,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 120,
              ),
              const Divider(),
              SizedBox(
                height: height / 120,
              ),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DoctorCms("about");
                    },
                  ));
                },
                child: Row(
                  children: [
                    Image.asset(
                      DoctorPngimage.about,
                      height: height / 36,
                      color: themedata.isdark
                          ? DoctorColor.white
                          : DoctorColor.black,
                    ),
                    SizedBox(
                      width: width / 26,
                    ),
                    Text(
                      "About_Us".tr,
                      style: iregular.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: height / 46,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 120,
              ),
              const Divider(),
              SizedBox(
                height: height / 120,
              ),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DoctorCms("privacy");
                    },
                  ));
                },
                child: Row(
                  children: [
                    Image.asset(
                      DoctorPngimage.imgprivacy,
                      height: height / 32,
                      color: themedata.isdark
                          ? DoctorColor.white
                          : DoctorColor.black,
                    ),
                    SizedBox(
                      width: width / 26,
                    ),
                    Text(
                      "Privacy_policy".tr,
                      style: iregular.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: height / 46,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 120,
              ),
              const Divider(),
              SizedBox(
                height: height / 120,
              ),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DoctorCms("terms");
                    },
                  ));
                },
                child: Row(
                  children: [
                    Image.asset(
                      DoctorPngimage.security,
                      height: height / 36,
                      color: themedata.isdark
                          ? DoctorColor.white
                          : DoctorColor.black,
                    ),
                    SizedBox(
                      width: width / 26,
                    ),
                    Text(
                      "Terms_Conditions".tr,
                      style: iregular.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: height / 46,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 120,
              ),
              const Divider(),
              SizedBox(
                height: height / 120,
              ),
              InkWell(
                child: Row(
                  children: [
                    Image.asset(
                      DoctorPngimage.darkmode,
                      height: height / 36,
                      color: themedata.isdark
                          ? DoctorColor.white
                          : DoctorColor.black,
                    ),
                    SizedBox(
                      width: width / 26,
                    ),
                    Text(
                      "DarkMode".tr,
                      style: iregular.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: height / 22,
                      width: width / 8,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Switch(
                          activeColor: DoctorColor.primary,
                          onChanged: (state) {
                            themedata.changeThem(state);
                            setState(() {
                              isdark = state;
                            });
                            themedata.update();
                          },
                          value: themedata.isdark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 120,
              ),
              const Divider(),
              SizedBox(
                height: height / 120,
              ),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  logout();
                },
                child: Row(
                  children: [
                    Image.asset(
                      DoctorPngimage.logout,
                      height: height / 36,
                      color: themedata.isdark
                          ? DoctorColor.white
                          : DoctorColor.black,
                    ),
                    SizedBox(
                      width: width / 26,
                    ),
                    Text(
                      "Log Out".tr,
                      style: iregular.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: height / 46,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  logout() {
    showModalBottomSheet(
        context: context,
        backgroundColor:
            themedata.isdark ? DoctorColor.black : DoctorColor.background,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 36, vertical: height / 56),
                child: Column(
                  children: [
                    Text(
                      "Logout".tr,
                      style: isemibold.copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: height / 96,
                    ),
                    const Divider(),
                    SizedBox(
                      height: height / 96,
                    ),
                    Text(
                      "Are_you_sure_you_want_to_log_out".tr,
                      style: iregular.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: height / 36,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: DoctorColor.transparent,
                          highlightColor: DoctorColor.transparent,
                          onTapDown: (TapDownDetails tapDetail) {
                            Get.back();
                          },
                          child: Container(
                            height: height / 16,
                            width: width / 2.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: DoctorColor.bgcolor),
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width / 22),
                              child: Center(
                                child: Text("Cancel".tr,
                                    style: imedium.copyWith(
                                        fontSize: 16,
                                        color: DoctorColor.black)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: DoctorColor.transparent,
                          highlightColor: DoctorColor.transparent,
                          onTapDown: (TapDownDetails details) async {
                            await Helping.saveToken("token", "");
                            await Helping.saveToken("id", "");
                            Get.to(() => const Signin());
                          },
                          child: Container(
                            height: height / 16,
                            width: width / 2.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: DoctorColor.primary),
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width / 22),
                              child: Center(
                                child: Text("Yes_Logout".tr,
                                    style: imedium.copyWith(
                                        fontSize: 16,
                                        color: DoctorColor.white)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          );
        });
  }
}
