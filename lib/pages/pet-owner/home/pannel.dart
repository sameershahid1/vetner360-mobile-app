import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetner360/globalclass/doctor_color.dart';
import 'package:vetner360/globalclass/doctor_fontstyle.dart';
import 'package:vetner360/globalclass/doctor_icons.dart';
import 'package:vetner360/helping/help.dart';
import 'package:vetner360/pages/pet-owner/pet/pet-registraton-form.dart';
import 'package:vetner360/theme/doctor_themecontroller.dart';
import 'package:http/http.dart' as http;

class PetOwnerPannel extends StatefulWidget {
  const PetOwnerPannel({Key? key}) : super(key: key);

  @override
  State<PetOwnerPannel> createState() => _PetOwnerPannelState();
}

class _PetOwnerPannelState extends State<PetOwnerPannel> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  var pageController = PageController();
  var selectedIndex = 0;
  final page = 1;
  final limit = 10;

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

  List petList = [];

  @override
  void initState() {
    getMyPet();
    super.initState();
  }

  Future<void> getMyPet() async {
    try {
      final formData = {
        "page": page,
        "limit": limit,
      };
      final userId = await Helping().getToken("id");
      final token = await Helping().getToken("token");
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final url =
          Uri.parse("http://192.168.0.14:8080/mobile/api/pet/my-pet/${userId}");
      final response =
          await http.post(url, headers: headers, body: jsonEncode(formData));
      final data = jsonDecode(response.body);
      this.petList = data['records'];
    } catch (e) {
      print('Error: $e');
    }
  }

  void registerPet() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return PetRegistrationForm();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "My Pets",
          style: isemibold.copyWith(
              fontSize: 26,
              color: themedata.isdark ? DoctorColor.white : DoctorColor.black),
        ),
        backgroundColor: DoctorColor.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: registerPet,
        backgroundColor: DoctorColor.primary,
        child: Icon(
          Icons.add,
          color: DoctorColor.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 36, vertical: height / 36),
            child: petList.length > 0
                ? Column(
                    children: [
                      ListView.separated(
                        itemCount: petList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: DoctorColor.transparent,
                            highlightColor: DoctorColor.transparent,
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: themedata.isdark
                                    ? DoctorColor.lightblack
                                    : DoctorColor.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 36,
                                    vertical: height / 56),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.asset(
                                            img[index],
                                            height: height / 7,
                                            width: height / 7,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width / 36,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: width / 2.35,
                                              child: Text(
                                                petList[index]['name'],
                                                style: ibold.copyWith(
                                                    fontSize: 16),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height / 96,
                                            ),
                                            Text(
                                              "${petList[index]['type']}, ${petList[index]['breed']}",
                                              style: isemibold.copyWith(
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              height: height / 96,
                                            ),
                                            Row(
                                              children: [
                                                // Image.asset(
                                                //   DoctorPngimage.,
                                                //   height: height / 46,
                                                //   color: themedata.isdark
                                                //       ? DoctorColor.white
                                                //       : DoctorColor.black,
                                                // ),
                                                SizedBox(
                                                  width: width / 46,
                                                ),
                                                Text(
                                                  "${petList[index]['dietPlan']}"
                                                      .tr,
                                                  style: iregular.copyWith(
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: height / 56,
                          );
                        },
                      )
                    ],
                  )
                : Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 4),
                    child: Text(
                      "No Pet is Registered",
                      style: ibold.copyWith(fontSize: 24),
                    ))),
      ),
    );
  }
}
