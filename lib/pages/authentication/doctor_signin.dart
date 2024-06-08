import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:vetner360/helping/help.dart';
import 'package:vetner360/pages/authentication/doctor_forgotpassword.dart';
import 'package:vetner360/pages/authentication/doctor_signup.dart';
import 'package:vetner360/pages/pet-owner/home/doctor_dashboard.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class DoctorSignin extends StatefulWidget {
  const DoctorSignin({Key? key}) : super(key: key);

  @override
  State<DoctorSignin> createState() => _DoctorSigninState();
}

class _DoctorSigninState extends State<DoctorSignin> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final themedata = Get.put(DoctorThemecontroler());

  final storage = const FlutterSecureStorage();

  Future<void> signAccount(TapDownDetails details) async {
    if (_formKey.currentState!.validate()) {
      try {
        final formData = {
          "email": _emailController.text.trim(),
          "password": _passwordController.text.trim(),
        };
        final url = Uri.parse("http://192.168.0.14:8080/mobile/api/login");

        final response = await http.post(url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(formData));
        final data = jsonDecode(response.body);
        if (response.statusCode != 200) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(data['message']),
            backgroundColor: DoctorColor.red,
          ));
        } else {
          final token = data['token'];
          final userId = data['userId'];
          await Helping().saveToken("token", token);
          await Helping().saveToken("id", userId);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DoctorDashboard("0");
            },
          ));
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    // Helping().checkForAuth().then((value) {
    //   if (value) {
    //     Navigator.push(context, MaterialPageRoute(
    //       builder: (context) {
    //         return DoctorDashboard("0");
    //       },
    //     ));
    //   }
    // });
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 36, vertical: height / 36),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: height / 24,
                  ),
                  SizedBox(
                    height: height / 36,
                  ),
                  Text(
                    "Hi_Welcome_Back".tr,
                    style: isemibold.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: height / 96,
                  ),
                  Text(
                    "Hope_youre_doing_fine".tr,
                    style: iregular.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: height / 26,
                  ),
                  TextFormField(
                      controller: _emailController,
                      validator: ValidationBuilder()
                          .email()
                          .minLength(3)
                          .maxLength(25)
                          .build(),
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      style: iregular.copyWith(
                          fontSize: 14, color: DoctorColor.textgrey),
                      decoration: InputDecoration(
                        hintText: 'Your_Email'.tr,
                        fillColor: themedata.isdark
                            ? DoctorColor.lightblack
                            : DoctorColor.bgcolor,
                        filled: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(
                            DoctorPngimage.email,
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
                  TextFormField(
                      controller: _passwordController,
                      validator: ValidationBuilder()
                          .minLength(6)
                          .maxLength(25)
                          .build(),
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      style: iregular.copyWith(
                          fontSize: 14, color: DoctorColor.textgrey),
                      decoration: InputDecoration(
                        hintText: 'Password'.tr,
                        fillColor: themedata.isdark
                            ? DoctorColor.lightblack
                            : DoctorColor.bgcolor,
                        filled: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(
                            DoctorPngimage.lock,
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
                    height: height / 26,
                  ),
                  InkWell(
                    splashColor: DoctorColor.transparent,
                    highlightColor: DoctorColor.transparent,
                    onTapDown: signAccount,
                    child: Container(
                      height: height / 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: DoctorColor.primary),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 22),
                        child: Center(
                          child: Text("Sign_In".tr,
                              style: imedium.copyWith(
                                  fontSize: 16, color: DoctorColor.white)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 26,
                  ),
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
                  SizedBox(
                    height: height / 36,
                  ),
                  Container(
                    width: width / 1,
                    height: height / 14,
                    decoration: BoxDecoration(
                        border: Border.all(color: DoctorColor.border),
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
                  SizedBox(
                    height: height / 56,
                  ),
                  Container(
                    width: width / 1,
                    height: height / 14,
                    decoration: BoxDecoration(
                        border: Border.all(color: DoctorColor.border),
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
                  SizedBox(
                    height: height / 36,
                  ),
                  InkWell(
                      splashColor: DoctorColor.transparent,
                      highlightColor: DoctorColor.transparent,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const DoctorForgotpassword();
                          },
                        ));
                      },
                      child: Text(
                        "Forgot_password".tr,
                        style:
                            imedium.copyWith(fontSize: 14, color: Colors.blue),
                      )),
                  SizedBox(
                    height: height / 46,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont_have_an_account_yet".tr,
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
                                return const DoctorSignup();
                              },
                            ));
                          },
                          child: Text(
                            "Sign_up".tr,
                            style: imedium.copyWith(
                                fontSize: 14, color: Colors.blue),
                          )),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
