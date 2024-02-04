import 'package:doctorappointment/doctor_pages/doctor_home/doctor_list.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  var pageController = PageController();
  var selectedIndex = 0;

  List img = [
    DoctorPngimage.c,
    DoctorPngimage.c2,
    DoctorPngimage.c3,
    DoctorPngimage.c4,
    DoctorPngimage.c5,
    DoctorPngimage.c6,
    DoctorPngimage.c7,
    DoctorPngimage.c8,
  ];

  List category = [
    "Dentistry",
    "Cardiolo..",
    "Pulmono..",
    "General",
    "Neurology",
    "Gastroen..",
    "Laborato..",
    "Vaccinat.."
  ];

  List img2 = [
    DoctorPngimage.m1,
    DoctorPngimage.m2,
    DoctorPngimage.m1,
    DoctorPngimage.m2,
  ];

  List name = ["Sunrise Health Clinic","Golden Cardiology Center","Sunrise Health Clinic","Golden Cardiology Center"];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor:
            themedata.isdark ? DoctorColor.black : DoctorColor.white,
        leadingWidth: width / 1,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 36),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location".tr,
                    style: iregular.copyWith(fontSize: 14),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        DoctorPngimage.locationfill,
                        height: height / 46,
                        color: themedata.isdark
                            ? DoctorColor.white
                            : DoctorColor.black,
                      ),
                      SizedBox(
                        width: width / 46,
                      ),
                      Text(
                        "Seattle, USA".tr,
                        style: isemibold.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        width: width / 56,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: height / 46,
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: DoctorColor.bgcolor,
                radius: 22,
                child: Image.asset(
                  DoctorPngimage.notification,
                  height: height / 30,
                  color: DoctorColor.primary,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            children: [
              TextFormField(
                readOnly: true,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const DoctorList();
                    },));
                  },
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(
                      fontSize: 14, color: DoctorColor.textgrey),
                  decoration: InputDecoration(
                    hintText: 'Search doctor...'.tr,
                    fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
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
                        borderSide:
                            const BorderSide(color: DoctorColor.border)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: DoctorColor.border)),
                  )),
              SizedBox(
                height: height / 36,
              ),
              StatefulBuilder(
                builder: (context, setState) {
                  return InkWell(
                    child: Column(
                      children: [
                        Container(
                          height: height / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //color: themedata.isdark?Colors.white10:DoctorColor.bgcolor
                          ),
                          child: PageView.builder(
                            controller: pageController,
                            onPageChanged: (index) {
                              selectedIndex = index;
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
                                        pageController.animateToPage(index,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeIn);
                                      },
                                      child: CircleAvatar(
                                        radius: 4,
                                        backgroundColor: selectedIndex == index
                                            ? DoctorColor.primary
                                            : themedata.isdark
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
                    "Categories".tr,
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
              GridView.builder(
                itemCount: img.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: (height / 6.5) / (width / 2.6)),
                itemBuilder: (context, index) {
                  return InkWell(
                      child: Column(
                    children: [
                      Image.asset(
                        img[index],
                        height: height / 12,
                        width: height / 12,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: height / 120,
                      ),
                      Text(
                        category[index],
                        style: ibold.copyWith(fontSize: 12),
                      ),
                    ],
                  ));
                },
              ),
              SizedBox(
                height: height / 36,
              ),
              Row(
                children: [
                  Text(
                    "Nearby_Medical_Centers".tr,
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
                height: height/2.8,
                child: ListView.separated(
                  itemCount: img2.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: width/1.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: themedata.isdark ? DoctorColor.lightblack : DoctorColor.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(8),topLeft: Radius.circular(8)),
                                child: Image.asset(img2[index],width: width/1.5,height: height/6,fit: BoxFit.fill,),
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
                                ),)
                            ],
                          ),
                          SizedBox(height: height/56,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/36),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name[index],
                                  style: ibold.copyWith(fontSize: 14),
                                ),
                                SizedBox(height: height/96,),
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
                                      "123 Oak Street, CA 98765".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height/96,),
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
                                SizedBox(height: height/120,),
                                const Divider(),
                                SizedBox(height: height/120,),
                                Row(
                                  children: [
                                    Image.asset(
                                      DoctorPngimage.routing,
                                      height: height / 46,
                                      color: themedata.isdark
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
                                      color: themedata.isdark
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
