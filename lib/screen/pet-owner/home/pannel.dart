import 'package:vetner360/component/latest-clinic-section/latest_clinic_section.dart';
import 'package:vetner360/component/latest-pet-section/latest_pet_section.dart';
import 'package:vetner360/controller/pet_owner_pannel_controller.dart';
import 'package:vetner360/screen/pet-owner/home/pet_search.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetOwnerPannel extends StatefulWidget {
  const PetOwnerPannel({Key? key}) : super(key: key);

  @override
  State<PetOwnerPannel> createState() => _PetOwnerPannelState();
}

class _PetOwnerPannelState extends State<PetOwnerPannel> {
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
                LatestPetSection(),
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
                SizedBox(
                  height: height / 36,
                ),
                LatestClinicSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
