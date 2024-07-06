import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:vetner360/theme/themecontroller.dart';

class BuyPetListItem extends StatelessWidget {
  final itemPet;
  BuyPetListItem({super.key, this.itemPet});
  final themedata = Get.put(DoctorThemecontroler());
  String name = "Dr. David Patel";
  final img = DoctorPngimage.d1;

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return InkWell(
      splashColor: DoctorColor.transparent,
      highlightColor: DoctorColor.transparent,
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) {
        //     return const MyPetDetail();
        //   },
        // ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: themedata.isdark ? DoctorColor.lightblack : DoctorColor.white,
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
                  img,
                  height: height / 6.5,
                  width: height / 6.5,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: width / 36,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: width / 2.35,
                        child: Text(
                          name,
                          style: ibold.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: width / 56,
                      ),
                      Image.asset(
                        DoctorPngimage.unlike,
                        height: height / 46,
                        color: themedata.isdark
                            ? DoctorColor.white
                            : DoctorColor.black,
                      ),
                    ],
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
                    "Cardiologist".tr,
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
                        color: themedata.isdark
                            ? DoctorColor.white
                            : DoctorColor.black,
                      ),
                      SizedBox(
                        width: width / 46,
                      ),
                      Text(
                        "Cardiology Center, USA".tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: iregular.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 96,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        DoctorPngimage.star,
                        height: height / 56,
                      ),
                      SizedBox(
                        width: width / 46,
                      ),
                      Text(
                        "5".tr,
                        style: iregular.copyWith(fontSize: 12),
                      ),
                      SizedBox(
                        width: width / 46,
                      ),
                      Text(
                        "| 1,872 Reviews".tr,
                        style: iregular.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
