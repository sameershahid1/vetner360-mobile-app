import 'package:vetner360/controller/edit_profile_controller.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDoctorProfile extends StatelessWidget {
  const EditDoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
      builder: (_) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: DoctorColor.transparent,
                    backgroundImage: AssetImage(DoctorPngimage.placeorder),
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
                            color: _.themedata.isdark
                                ? DoctorColor.white
                                : DoctorColor.black),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(DoctorPngimage.edit,
                              height: height / 46,
                              color: _.themedata.isdark
                                  ? DoctorColor.black
                                  : DoctorColor.white),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: height / 36,
            ),
            TextFormField(
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                style: iregular.copyWith(
                    fontSize: 14, color: DoctorColor.textgrey),
                decoration: InputDecoration(
                  hintText: 'Your_Name'.tr,
                  fillColor: _.themedata.isdark
                      ? DoctorColor.lightblack
                      : DoctorColor.bgcolor,
                  filled: true,
                  hintStyle: iregular.copyWith(
                      fontSize: 14, color: DoctorColor.textgrey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: DoctorColor.border)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: DoctorColor.border)),
                )),
            SizedBox(
              height: height / 36,
            ),
            TextFormField(
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                style: iregular.copyWith(
                    fontSize: 14, color: DoctorColor.textgrey),
                decoration: InputDecoration(
                  hintText: 'Email'.tr,
                  fillColor: _.themedata.isdark
                      ? DoctorColor.lightblack
                      : DoctorColor.bgcolor,
                  filled: true,
                  hintStyle: iregular.copyWith(
                      fontSize: 14, color: DoctorColor.textgrey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: DoctorColor.border)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: DoctorColor.border)),
                )),
            SizedBox(
              height: height / 36,
            ),
            TextFormField(
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                style: iregular.copyWith(
                    fontSize: 14, color: DoctorColor.textgrey),
                decoration: InputDecoration(
                  hintText: 'Phoneno'.tr,
                  fillColor: _.themedata.isdark
                      ? DoctorColor.lightblack
                      : DoctorColor.bgcolor,
                  filled: true,
                  hintStyle: iregular.copyWith(
                      fontSize: 14, color: DoctorColor.textgrey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: DoctorColor.border)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: DoctorColor.border)),
                )),
            SizedBox(
              height: height / 26,
            ),
            InkWell(
              splashColor: DoctorColor.transparent,
              highlightColor: DoctorColor.transparent,
              onTap: () {},
              child: Container(
                height: height / 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: DoctorColor.primary),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 22),
                  child: Center(
                    child: Text("Save".tr,
                        style: imedium.copyWith(
                            fontSize: 16, color: DoctorColor.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
