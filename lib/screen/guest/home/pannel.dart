import 'package:vetner360/controller/pet_owner_pannel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:vetner360/screen/pet-owner/home/pet_search.dart';

class GuestPannel extends StatefulWidget {
  const GuestPannel({Key? key}) : super(key: key);

  @override
  State<GuestPannel> createState() => _GuestPannelState();
}

class _GuestPannelState extends State<GuestPannel> {
  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return GetBuilder<PetOwnerPannelController>(
      init: PetOwnerPannelController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor:
              _.themedata.isdark ? DoctorColor.black : DoctorColor.white,
          leadingWidth: width / 1,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 36),
            child: TextFormField(
              readOnly: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return PetSearch();
                  },
                ));
              },
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              style:
                  iregular.copyWith(fontSize: 14, color: DoctorColor.textgrey),
              decoration: InputDecoration(
                hintText: 'Search Pets to buy'.tr,
                fillColor: _.themedata.isdark
                    ? DoctorColor.lightblack
                    : DoctorColor.bgcolor,
                filled: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    DoctorPngimage.search,
                    height: height / 36,
                  ),
                ),
                hintStyle: iregular.copyWith(
                    fontSize: 14, color: DoctorColor.textgrey),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: DoctorColor.border)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: DoctorColor.border)),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 36, vertical: height / 36),
            child: Column(
              children: [
                StatefulBuilder(
                  builder: (context, setState) {
                    return InkWell(
                      child: Column(
                        children: [
                          Container(
                            height: height / 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //color: _.themedata.isdark?Colors.white10:DoctorColor.bgcolor
                            ),
                            child: PageView.builder(
                              controller: _.pageController,
                              onPageChanged: (index) {
                                _.selectedIndex = index;
                                setState(() {});
                              },
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 120),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        DoctorPngimage.banner,
                                        width: width / 1,
                                        height: height / 3.8,
                                        fit: BoxFit.fill,
                                      )),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: height / 56,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List<Widget>.generate(
                                4,
                                (index) => Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width / 96),
                                      child: InkWell(
                                        onTap: () {
                                          _.pageController.animateToPage(index,
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              curve: Curves.easeIn);
                                        },
                                        child: CircleAvatar(
                                          radius: 4,
                                          backgroundColor:
                                              _.selectedIndex == index
                                                  ? DoctorColor.primary
                                                  : _.themedata.isdark
                                                      ? Colors.white10
                                                      : DoctorColor.bgcolor,
                                        ),
                                      ),
                                    )),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: height / 36,
                ),
                Row(
                  children: [
                    Text(
                      "Latest Animal".tr,
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
                SizedBox(
                  height: height / 2.8,
                  child: ListView.separated(
                    itemCount: _.img2.length,
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
                                    _.img2[index],
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
                                    _.name[index],
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
                ),
                SizedBox(
                  height: height / 36,
                ),
                Row(
                  children: [
                    Text(
                      "Pet Type".tr,
                      style: ibold.copyWith(fontSize: 16),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(
                  height: height / 56,
                ),
                GridView.builder(
                  itemCount: _.img.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: (height / 6.5) / (width / 2.6)),
                  itemBuilder: (context, index) {
                    return InkWell(
                        key: ValueKey(index),
                        child: Column(
                          children: [
                            Image.asset(
                              _.img[index],
                              height: height / 12,
                              width: height / 12,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: height / 120,
                            ),
                            Text(
                              _.petTypes[index],
                              style: ibold.copyWith(fontSize: 12),
                            ),
                          ],
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
