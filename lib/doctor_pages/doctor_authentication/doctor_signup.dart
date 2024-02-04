import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_fillprofile.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_signin.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorSignup extends StatefulWidget {
  const DoctorSignup({Key? key}) : super(key: key);

  @override
  State<DoctorSignup> createState() => _DoctorSignupState();
}

class _DoctorSignupState extends State<DoctorSignup> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              SizedBox(height: height/24,),
              SizedBox(height: height/36,),
              Text("Create_Account".tr,style: isemibold.copyWith(fontSize: 20),),
              SizedBox(height: height/96,),
              Text("We_are_here_to_help_you".tr,style: iregular.copyWith(fontSize: 14),),
              SizedBox(height: height/26,),
              TextFormField(
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                  decoration: InputDecoration(
                    hintText: 'Your_Name'.tr,
                    fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(DoctorPngimage.user,height: height/36,),
                    ),
                    hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                  )),
              SizedBox(height: height/36,),
              TextFormField(
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                  decoration: InputDecoration(
                    hintText: 'Your_Email'.tr,
                    fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(DoctorPngimage.email,height: height/36,),
                    ),
                    hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                  )),
              SizedBox(height: height/36,),
              TextFormField(
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                  decoration: InputDecoration(
                    hintText: 'Password'.tr,
                    fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(DoctorPngimage.lock,height: height/36,),
                    ),
                    hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                  )),
              SizedBox(height: height/26,),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const DoctorFillProfile();
                    },
                  ));
                },
                child: Container(
                  height: height / 15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: DoctorColor.primary),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/22),
                    child: Center(
                      child: Text("Create_Account".tr,
                          style: imedium.copyWith(
                              fontSize: 16, color: DoctorColor.white)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height/26,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: height / 500,
                      width: width / 2.85,
                      color: DoctorColor.border),
                  Text(
                    "or".tr,
                    style: imedium.copyWith(
                        fontSize: 16, color: DoctorColor.textgrey),
                  ),
                  Container(
                      height: height / 500,
                      width: width / 2.85,
                      color: DoctorColor.border),
                ],
              ),
              SizedBox(height: height/36,),
              Container(
                width: width / 1,
                height: height / 14,
                decoration: BoxDecoration(
                    border: Border.all(color:DoctorColor.border),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      DoctorPngimage.google,
                      height: height / 36,
                    ),
                    SizedBox(
                      width: width / 26,
                    ),
                    Text(
                      "Continue_with_Google".tr,
                      style: imedium.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height/56,),
              Container(
                width: width / 1,
                height: height / 14,
                decoration: BoxDecoration(
                    border: Border.all(color:DoctorColor.border),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      DoctorPngimage.facebook,
                      height: height / 30,
                    ),
                    SizedBox(
                      width: width / 26,
                    ),
                    Text(
                      "Continue_with_Facebook".tr,
                      style: imedium.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height/36,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Do_you_have_anaccount".tr,
                    style: iregular.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    width: width / 96,
                  ),
                  InkWell(
                      splashColor: DoctorColor.transparent,
                      highlightColor: DoctorColor.transparent,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const DoctorSignin();
                          },
                        ));
                      },
                      child: Text(
                        "Sign_In".tr,
                        style: imedium.copyWith(
                            fontSize: 14, color: Colors.blue),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
