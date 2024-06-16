import 'package:vetner360/screen/authentication/forgotpassword.dart';
import 'package:vetner360/screen/authentication/signup.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:form_validator/form_validator.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:vetner360/controller/sigin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return GetBuilder<SignInController>(
        init: SignInController(),
        builder: (_) => Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 36, vertical: height / 36),
                    child: Form(
                      key: _.formKey,
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
                              controller: _.emailController,
                              validator: ValidationBuilder()
                                  .email()
                                  .minLength(3)
                                  .maxLength(25)
                                  .build(),
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              style: iregular.copyWith(
                                  fontSize: 14, color: DoctorColor.textgrey),
                              decoration: InputDecoration(
                                hintText: 'Your_Email'.tr,
                                fillColor: _.themedata.isdark
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
                                    borderSide: const BorderSide(
                                        color: DoctorColor.border)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: DoctorColor.border)),
                              )),
                          SizedBox(
                            height: height / 36,
                          ),
                          TextFormField(
                              controller: _.passwordController,
                              validator: ValidationBuilder()
                                  .minLength(6)
                                  .maxLength(25)
                                  .build(),
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              style: iregular.copyWith(
                                  fontSize: 14, color: DoctorColor.textgrey),
                              decoration: InputDecoration(
                                hintText: 'Password'.tr,
                                fillColor: _.themedata.isdark
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
                                    borderSide: const BorderSide(
                                        color: DoctorColor.border)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: DoctorColor.border)),
                              )),
                          SizedBox(
                            height: height / 26,
                          ),
                          InkWell(
                            splashColor: DoctorColor.transparent,
                            highlightColor: DoctorColor.transparent,
                            onTapDown: (TapDownDetails tap) {
                              _.signAccount(context);
                            },
                            child: Container(
                              height: height / 15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: DoctorColor.primary),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 22),
                                child: Center(
                                  child: Text("Sign_In".tr,
                                      style: imedium.copyWith(
                                          fontSize: 16,
                                          color: DoctorColor.white)),
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
                                style: imedium.copyWith(
                                    fontSize: 14, color: Colors.blue),
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
                                        return const Signup();
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
            ));
  }
}
