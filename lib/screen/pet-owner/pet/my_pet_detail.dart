import 'package:vetner360/component/pet-info/index.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPetDetail extends StatefulWidget {
  final petItem;
  final bool isBuyer;
  final String? phoneNumber;
  final int? price;
  const MyPetDetail({
    super.key,
    required this.petItem,
    required this.isBuyer,
    this.phoneNumber,
    this.price,
  });

  @override
  State<MyPetDetail> createState() => _MyPetDetailState();
}

class _MyPetDetailState extends State<MyPetDetail> {
  final themedata = Get.put(DoctorThemecontroler());
  double height = 0.00;
  double width = 0.00;
  dynamic size;

  void launchDialer() async {
    try {
      final url = Uri(scheme: 'tel', path: widget.phoneNumber);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        print("Could not launch telephone");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  void launchSMS() async {
    try {
      final url = Uri(scheme: 'sms', path: widget.phoneNumber);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
        return;
      }
      print("Could not launch sms");
    } catch (error) {
      print("Error: $error");
    }
  }

  Future<void> launchWhatsapp() async {
    try {
      final url = Uri(
        scheme: 'https',
        host: 'wa.me',
        path: widget.phoneNumber,
        queryParameters: {'text': Uri.encodeFull("Hi, sir")},
      );
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        print("Could not launch whatsapp");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  Widget getCall() {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        IconButton(
          onPressed: launchDialer,
          icon: Icon(Icons.dialer_sip),
        ),
        Spacer(),
        IconButton(
          onPressed: launchWhatsapp,
          icon: Icon(Icons.call),
        ),
        Spacer(),
        IconButton(
          onPressed: launchSMS,
          icon: Icon(Icons.sms),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: Column(
                children: [
                  Image.network(
                    'http://vetner360.koyeb.app//${widget.petItem['imagePath']}',
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
                          ),
                        );
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
              child: PetInfo(petItem: widget.petItem, price: widget.price),
            ),
            Container(
              child: (widget.isBuyer ? getCall() : null),
            ),
          ],
        ),
      ),
    );
  }
}
