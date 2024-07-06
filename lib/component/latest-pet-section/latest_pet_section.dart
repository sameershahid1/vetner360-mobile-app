import 'package:vetner360/controller/latest_pet_section_controller.dart';
import 'package:vetner360/screen/pet-owner/pet/my_pet_detail.dart';
import 'package:vetner360/screen/buying/buy_pet.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LatestPetSection extends StatelessWidget {
  LatestPetSection({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return GetBuilder<LatestPetSectionController>(
      init: LatestPetSectionController(context),
      builder: (_) => Column(children: [
        Row(
          children: [
            Text(
              key: ValueKey(1),
              "Latest Pets on Sale".tr,
              style: ibold.copyWith(fontSize: 16),
            ),
            const Spacer(),
            GestureDetector(
              onTapDown: (TapDownDetails data) {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BuyPet();
                  },
                ));
              },
              child: Text(
                key: ValueKey(2),
                "See_All".tr,
                style: imedium.copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height / 56,
        ),
        Obx(() {
          final copy = _.latestPet.toList();
          return SizedBox(
            height: height / 2.5,
            child: ListView.separated(
              itemCount: copy.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTapDown: (TapDownDetails data) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return MyPetDetail(
                            petItem: _.latestPet[index]["petDetail"],
                            isBuyer: true,
                            phoneNumber: _.latestPet[index]['contactNo'],
                            price: _.latestPet[index]['price'],
                          );
                        },
                      ));
                    },
                    child: Container(
                      key: ValueKey(_.latestPet[index]['id']),
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
                                child: Image.network(
                                  'http://vetner360.koyeb.app//${_.latestPet[index]["petDetail"]['imagePath']}',
                                  width: width / 1.5,
                                  height: height / 5,
                                  fit: BoxFit.fill,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress != null) {
                                      return Center(
                                          child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: CircularProgressIndicator(),
                                      ));
                                    } else {
                                      return Center(child: child);
                                    }
                                  },
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
                                  _.latestPet[index]["petDetail"]['name'],
                                  style: ibold.copyWith(fontSize: 14),
                                ),
                                SizedBox(
                                  height: height / 96,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.pets),
                                    SizedBox(
                                      key: ValueKey(2),
                                      width: width / 60,
                                    ),
                                    Text(
                                      key: ValueKey(3),
                                      "${_.latestPet[index]["petDetail"]['type']}, ${_.latestPet[index]["petDetail"]['breed']}"
                                          .tr,
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
                                    // Image.asset(
                                    //   DoctorPngimage.routing,
                                    //   height: height / 46,
                                    //   color: _.themedata.isdark
                                    //       ? DoctorColor.white
                                    //       : DoctorColor.black,
                                    // ),
                                    Text(
                                      "Price: ".tr,
                                      style: isemibold.copyWith(fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: width / 60,
                                    ),
                                    Text(
                                      "${_.latestPet[index]['price']}".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: width / 36,
                );
              },
            ),
          );
        }),
      ]),
    );
  }
}
