import 'package:vetner360/component/pet-info/index.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPetDetail extends StatefulWidget {
  final petItem;
  const MyPetDetail({super.key, required this.petItem});

  @override
  State<MyPetDetail> createState() => _MyPetDetailState();
}

class _MyPetDetailState extends State<MyPetDetail> {
  final themedata = Get.put(DoctorThemecontroler());
  double height = 0.00;
  double width = 0.00;
  dynamic size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Pet Profile",
        style: isemibold.copyWith(
            fontSize: 26,
            color: themedata.isdark ? DoctorColor.white : DoctorColor.black),
      )),
      body:
          // DefaultTabController(
          //   length: 3,
          SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              // padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Image.network(
                    'http://192.168.0.14:8080/${widget.petItem['imagePath']}',
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
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
                  SizedBox(height: 16),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 15, left: 30, right: 30),
                child: PetInfo(
                  petItem: widget.petItem,
                )),
          ],
        ),
      ),
    );
  }
}
