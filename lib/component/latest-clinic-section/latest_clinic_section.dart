import 'package:path/path.dart';
import 'package:vetner360/controller/latest_clinic_section_controller.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LatestClinicSection extends StatelessWidget {
  LatestClinicSection({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return GetBuilder<LatestClinicSectionController>(
      init: LatestClinicSectionController(context),
      builder: (_) => Column(
        children: [
          Row(
            children: [
              Text(
                "Latest_Veterinary".tr,
                style: ibold.copyWith(fontSize: 16),
              ),
              const Spacer(),
              Text(
                "See_All".tr,
                style: imedium.copyWith(fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: height / 56,
          ),
          Obx(
            () {
              final copy = _.clinicList.toList();
              return SizedBox(
                height: height / 2.8,
                child: ListView.separated(
                  itemCount: copy.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      key: ValueKey(index),
                      width: width / 1.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: _.themedata.isdark
                            ? DoctorColor.lightblack
                            : DoctorColor.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    topLeft: Radius.circular(8)),
                                child: Image.asset(
                                  _.img2,
                                  width: width / 1.5,
                                  height: height / 6,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: CircleAvatar(
                                  backgroundColor: const Color(0x331F2A37),
                                  radius: 18,
                                  child: Image.asset(
                                    DoctorPngimage.unlike,
                                    height: height / 46,
                                    color: DoctorColor.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height / 56,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 36),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _.name,
                                  style: ibold.copyWith(fontSize: 14),
                                ),
                                SizedBox(
                                  height: height / 96,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      DoctorPngimage.location,
                                      height: height / 46,
                                      color: _.themedata.isdark
                                          ? DoctorColor.white
                                          : DoctorColor.black,
                                    ),
                                    SizedBox(
                                      width: width / 46,
                                    ),
                                    Text(
                                      "123 Oak Street, CA 98765".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height / 96,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "5.0".tr,
                                      style: isemibold.copyWith(fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: width / 46,
                                    ),
                                    Image.asset(
                                      DoctorPngimage.star5,
                                      height: height / 56,
                                    ),
                                    SizedBox(
                                      width: width / 46,
                                    ),
                                    Text(
                                      "(58 Reviews)".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height / 120,
                                ),
                                const Divider(),
                                SizedBox(
                                  height: height / 120,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      DoctorPngimage.routing,
                                      height: height / 46,
                                      color: _.themedata.isdark
                                          ? DoctorColor.white
                                          : DoctorColor.black,
                                    ),
                                    SizedBox(
                                      width: width / 46,
                                    ),
                                    Text(
                                      "2.5 km/40min".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      DoctorPngimage.hospital,
                                      height: height / 46,
                                      color: _.themedata.isdark
                                          ? DoctorColor.white
                                          : DoctorColor.black,
                                    ),
                                    SizedBox(
                                      width: width / 46,
                                    ),
                                    Text(
                                      "Hospital".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: width / 36,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
