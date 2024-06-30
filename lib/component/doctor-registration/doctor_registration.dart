import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:vetner360/controller/doctor_registration_controller.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:get/get.dart';

class DoctorRegistration extends StatelessWidget {
  const DoctorRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return GetBuilder<DoctorRegistrationController>(
        init: DoctorRegistrationController(),
        dispose: (_) {
          _.controller?.firstNameController.dispose();
          _.controller?.experienceController.dispose();
          _.controller?.bioController.dispose();
          _.controller?.lastNameController.dispose();
          _.controller?.emailController.dispose();
          _.controller?.phoneNoController.dispose();
          _.controller?.fatherNameController.dispose();
          _.controller?.registrationController.dispose();
          _.controller?.clinicNameController.dispose();
          _.controller?.passwordController.dispose();
          _.controller?.conformPasswordController.dispose();
        },
        builder: (_) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 36, vertical: height / 36),
                child: Column(
                  children: [
                    SizedBox(
                      height: height / 36,
                    ),
                    Form(
                      key: _.formKey,
                      child: Column(
                        children: [
                          TextFormField(
                              controller: _.firstNameController,
                              validator: ValidationBuilder()
                                  .minLength(3)
                                  .maxLength(25)
                                  .build(),
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              style: iregular.copyWith(
                                  fontSize: 14, color: DoctorColor.textgrey),
                              decoration: InputDecoration(
                                hintText: 'First Name'.tr,
                                fillColor: _.themedata.isdark
                                    ? DoctorColor.lightblack
                                    : DoctorColor.bgcolor,
                                filled: true,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Image.asset(
                                    DoctorPngimage.user,
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
                          TextFormField(
                              controller: _.lastNameController,
                              validator: ValidationBuilder()
                                  .minLength(3)
                                  .maxLength(25)
                                  .build(),
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              style: iregular.copyWith(
                                  fontSize: 14, color: DoctorColor.textgrey),
                              decoration: InputDecoration(
                                hintText: 'LastName'.tr,
                                fillColor: _.themedata.isdark
                                    ? DoctorColor.lightblack
                                    : DoctorColor.bgcolor,
                                filled: true,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Image.asset(
                                    DoctorPngimage.user,
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
                          TextFormField(
                            controller: _.bioController,
                            validator: ValidationBuilder()
                                .minLength(10)
                                .maxLength(255)
                                .build(),
                            maxLines: 5,
                            scrollPadding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            style: iregular.copyWith(
                                fontSize: 14, color: DoctorColor.textgrey),
                            decoration: InputDecoration(
                              hintText: 'Bio'.tr,
                              fillColor: _.themedata.isdark
                                  ? DoctorColor.lightblack
                                  : DoctorColor.bgcolor,
                              filled: true,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Icon(Icons.description_outlined,
                                    color: DoctorColor.textgrey),
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
                            ),
                          ),
                          SizedBox(
                            height: height / 26,
                          ),
                          TextFormField(
                              controller: _.fatherNameController,
                              validator: ValidationBuilder()
                                  .minLength(3)
                                  .maxLength(25)
                                  .build(),
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              style: iregular.copyWith(
                                  fontSize: 14, color: DoctorColor.textgrey),
                              decoration: InputDecoration(
                                hintText: 'Father Name'.tr,
                                fillColor: _.themedata.isdark
                                    ? DoctorColor.lightblack
                                    : DoctorColor.bgcolor,
                                filled: true,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Image.asset(
                                    DoctorPngimage.user,
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
                          TextFormField(
                              controller: _.registrationController,
                              validator:
                                  ValidationBuilder().minLength(3).build(),
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              style: iregular.copyWith(
                                  fontSize: 14, color: DoctorColor.textgrey),
                              decoration: InputDecoration(
                                hintText: 'Registration'.tr,
                                fillColor: _.themedata.isdark
                                    ? DoctorColor.lightblack
                                    : DoctorColor.bgcolor,
                                filled: true,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Image.asset(
                                    DoctorPngimage.user,
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
                          TextFormField(
                              controller: _.experienceController,
                              validator: ValidationBuilder()
                                  .minLength(1)
                                  .maxLength(10)
                                  .build(),
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              style: iregular.copyWith(
                                  fontSize: 14, color: DoctorColor.textgrey),
                              decoration: InputDecoration(
                                hintText: 'Experience'.tr,
                                fillColor: _.themedata.isdark
                                    ? DoctorColor.lightblack
                                    : DoctorColor.bgcolor,
                                filled: true,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Image.asset(
                                    DoctorPngimage.user,
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
                          TextFormField(
                            controller: _.clinicNameController,
                            validator: ValidationBuilder()
                                .minLength(3)
                                .maxLength(25)
                                .build(),
                            scrollPadding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            style: iregular.copyWith(
                                fontSize: 14, color: DoctorColor.textgrey),
                            decoration: InputDecoration(
                              hintText: 'Clinic Name'.tr,
                              fillColor: _.themedata.isdark
                                  ? DoctorColor.lightblack
                                  : DoctorColor.bgcolor,
                              filled: true,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Image.asset(
                                  DoctorPngimage.user,
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
                            ),
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
                            height: height / 26,
                          ),
                          TextFormField(
                              controller: _.phoneNoController,
                              validator: ValidationBuilder()
                                  .phone()
                                  .minLength(3)
                                  .maxLength(25)
                                  .build(),
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              style: iregular.copyWith(
                                  fontSize: 14, color: DoctorColor.textgrey),
                              decoration: InputDecoration(
                                hintText: 'Phone No'.tr,
                                fillColor: _.themedata.isdark
                                    ? DoctorColor.lightblack
                                    : DoctorColor.bgcolor,
                                filled: true,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Image.asset(
                                    DoctorPngimage.user,
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
                          Obx(
                            () => TextFormField(
                                readOnly: true,
                                onTap: () {
                                  _.showAlertDialog(context);
                                },
                                scrollPadding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                style: iregular.copyWith(
                                    fontSize: 14, color: DoctorColor.textgrey),
                                decoration: InputDecoration(
                                  hintText: _.latitude.value != 0 &&
                                          _.longitude.value != 0
                                      ? "(${_.latitude.value},${_.longitude.value})"
                                      : 'Location',
                                  fillColor: _.themedata.isdark
                                      ? DoctorColor.lightblack
                                      : DoctorColor.bgcolor,
                                  filled: true,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Image.asset(
                                      DoctorPngimage.location,
                                      height: height / 36,
                                    ),
                                  ),
                                  hintStyle: iregular.copyWith(
                                      fontSize: 14,
                                      color: DoctorColor.textgrey),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: DoctorColor.border)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: DoctorColor.border)),
                                )),
                          ),
                          SizedBox(
                            height: height / 26,
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
                          TextFormField(
                              controller: _.conformPasswordController,
                              validator: _.validatePasswordMatch,
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              style: iregular.copyWith(
                                  fontSize: 14, color: DoctorColor.textgrey),
                              decoration: InputDecoration(
                                hintText: 'Conform Password'.tr,
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
                            onTapDown: (TapDownDetails down) {
                              _.createAccount(context);
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
                                  child: Text("Create_Account".tr,
                                      style: imedium.copyWith(
                                          fontSize: 16,
                                          color: DoctorColor.white)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 36,
                    ),
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
                              Navigator.pop(context);
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
            ));
  }
}
