import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vetner360/controller/doctor_detail.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:vetner360/screen/chat/user_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDetails extends StatelessWidget {
  DoctorDetails({super.key, required this.detailInfo});
  final detailInfo;

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    LatLng location = LatLng(detailInfo['location']['coordinates'][1],
        detailInfo['location']['coordinates'][0]);

    return GetBuilder<DoctorDetailController>(
        init: DoctorDetailController(location),
        builder: (_) => Scaffold(
              appBar: AppBar(
                surfaceTintColor: DoctorColor.white,
                title: Text(
                  "Doctor_Details".tr,
                  style: isemibold.copyWith(
                      fontSize: 20,
                      color: _.themedata.isdark
                          ? DoctorColor.white
                          : DoctorColor.black),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 36),
                    child: Image.asset(
                      DoctorPngimage.unlike,
                      height: height / 46,
                      color: _.themedata.isdark
                          ? DoctorColor.white
                          : DoctorColor.black,
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 36, vertical: height / 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: _.themedata.isdark
                              ? DoctorColor.lightblack
                              : DoctorColor.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width / 36, vertical: height / 80),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  DoctorPngimage.d1,
                                  height: height / 7,
                                  width: height / 7,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: width / 36,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width / 2.35,
                                    child: Text(
                                      "Dr. ${detailInfo['firstName']} ${detailInfo['lastName']}"
                                          .tr,
                                      style: ibold.copyWith(fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 96,
                                  ),
                                  Container(
                                      height: height / 500,
                                      width: width / 2,
                                      color: DoctorColor.bgcolor),
                                  SizedBox(
                                    height: height / 96,
                                  ),
                                  Text(
                                    "${detailInfo['clinicName']}".tr,
                                    style: isemibold.copyWith(fontSize: 14),
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
                                      Obx(
                                        () => Text(
                                          "${_.address.value}".tr,
                                          style:
                                              iregular.copyWith(fontSize: 14),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: DoctorColor.bgcolor,
                                radius: 28,
                                child: Image.asset(
                                  DoctorPngimage.user2,
                                  height: height / 30,
                                  color: DoctorColor.black,
                                ),
                              ),
                              SizedBox(
                                height: height / 96,
                              ),
                              Text(
                                "2,000+".tr,
                                style: isemibold.copyWith(fontSize: 14),
                              ),
                              Text(
                                "patients".tr,
                                style: iregular.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: DoctorColor.bgcolor,
                                radius: 28,
                                child: Image.asset(
                                  DoctorPngimage.medal,
                                  height: height / 30,
                                  color: DoctorColor.black,
                                ),
                              ),
                              SizedBox(
                                height: height / 96,
                              ),
                              Text(
                                "10+".tr,
                                style: isemibold.copyWith(fontSize: 14),
                              ),
                              Text(
                                "experience".tr,
                                style: iregular.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: DoctorColor.bgcolor,
                                radius: 28,
                                child: Image.asset(
                                  DoctorPngimage.starfill,
                                  height: height / 30,
                                  color: DoctorColor.black,
                                ),
                              ),
                              SizedBox(
                                height: height / 96,
                              ),
                              Text(
                                "5".tr,
                                style: isemibold.copyWith(fontSize: 14),
                              ),
                              Text(
                                "rating".tr,
                                style: iregular.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: DoctorColor.bgcolor,
                                radius: 28,
                                child: Image.asset(
                                  DoctorPngimage.messages,
                                  height: height / 30,
                                  color: DoctorColor.black,
                                ),
                              ),
                              SizedBox(
                                height: height / 96,
                              ),
                              Text(
                                "1,872".tr,
                                style: isemibold.copyWith(fontSize: 14),
                              ),
                              Text(
                                "reviews".tr,
                                style: iregular.copyWith(fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      Text(
                        "About_me".tr,
                        style: isemibold.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: height / 56,
                      ),
                      Text(
                        "Dr. David Patel, a dedicated cardiologist, brings a wealth of experience to Golden Gate Cardiology Center in Golden Gate, CA. view more"
                            .tr,
                        style: iregular.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      Text(
                        "Working_Time".tr,
                        style: isemibold.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: height / 56,
                      ),
                      Text(
                        "Monday-Friday, 08.00 AM-18.00 pM".tr,
                        style: iregular.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      Row(
                        children: [
                          Text(
                            "Reviews".tr,
                            style: isemibold.copyWith(fontSize: 20),
                          ),
                          const Spacer(),
                          Text(
                            "See_All".tr,
                            style: imedium.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      SizedBox(
                        height: height / 6,
                        child: ListView.separated(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage:
                                          AssetImage(DoctorPngimage.d1),
                                    ),
                                    SizedBox(
                                      width: width / 36,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Emily Anderson".tr,
                                          style: ibold.copyWith(fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: height / 120,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "5.0".tr,
                                              style: isemibold.copyWith(
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: width / 46,
                                            ),
                                            Image.asset(
                                              DoctorPngimage.star5,
                                              height: height / 56,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height / 56,
                                ),
                                SizedBox(
                                  width: width / 1.08,
                                  child: Text(
                                    "Dr. Patel is a true professional who genuinely cares about his patients. I highly recommend Dr. Patel to"
                                        .tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: iregular.copyWith(fontSize: 14),
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: width / 36,
                            );
                          },
                        ),
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
                              return UserChat(detailInfo: detailInfo);
                            },
                          ));
                        },
                        child: Container(
                          height: height / 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: DoctorColor.primary),
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 22),
                            child: Center(
                              child: Text("Chat Now".tr,
                                  style: imedium.copyWith(
                                      fontSize: 16, color: DoctorColor.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
