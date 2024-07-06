import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:vetner360/utils/helping/help.dart';
import 'package:vetner360/screen/pet-owner/home/dashboard.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ActivityRegisterForm extends StatefulWidget {
  final String petId;
  const ActivityRegisterForm({super.key, required this.petId});

  @override
  State<ActivityRegisterForm> createState() => _ActivityRegisterFormState();
}

class _ActivityRegisterFormState extends State<ActivityRegisterForm> {
  final themedata = Get.put(DoctorThemecontroler());
  double width = 0.00;
  double height = 0.00;
  dynamic size;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _noteController = TextEditingController();
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> createPetActivity(TapDownDetails details) async {
    if (_formKey.currentState!.validate()) {
      try {
        final token = await Helping.getToken("token");
        Map<String, String> headers = {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        };

        final formData = {
          "name": _nameController.text,
          "note": _noteController.text,
          "startTime": selectedStartDate!.toIso8601String(),
          "endTime": selectedEndDate!.toIso8601String(),
          "petId": widget.petId,
        };
        final url =
            Uri.parse("http://vetner360.koyeb.app//mobile/api/pet/activity/");

        final response =
            await http.post(url, headers: headers, body: jsonEncode(formData));
        final data = jsonDecode(response.body);

        if (response.statusCode != 200) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(data['message']),
            backgroundColor: DoctorColor.red,
          ));
        } else {
          Navigator.of(context).popUntil(
              (route) => route.isFirst); // Pop all routes until the first one
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PetOwnerDashboard(),
              ));
        }
      } catch (e) {
        print('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$e'),
          backgroundColor: DoctorColor.red,
        ));
      }
    }
  }

  Future<void> _handleSelectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedStartDate ?? DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedStartDate) {
      setState(() {
        selectedStartDate = pickedDate;
      });
    }
  }

  Future<void> _handleSelectEndDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedEndDate ?? DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedEndDate) {
      setState(() {
        selectedEndDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: DoctorColor.white,
        title: Text(
          "Add Activity".tr,
          style: isemibold.copyWith(
              fontSize: 20,
              color: themedata.isdark ? DoctorColor.white : DoctorColor.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                    controller: _nameController,
                    validator:
                        ValidationBuilder().minLength(3).maxLength(25).build(),
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    style: iregular.copyWith(
                        fontSize: 14, color: DoctorColor.textgrey),
                    decoration: InputDecoration(
                      hintText: 'Name'.tr,
                      fillColor: themedata.isdark
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
                    readOnly: true,
                    onTap: () => _handleSelectStartDate(context),
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    style: iregular.copyWith(
                        fontSize: 14, color: DoctorColor.textgrey),
                    decoration: InputDecoration(
                      hintText:
                          selectedStartDate?.toIso8601String() ?? 'Start Date',
                      fillColor: themedata.isdark
                          ? DoctorColor.lightblack
                          : DoctorColor.bgcolor,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          DoctorPngimage.calendar,
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
                    readOnly: true,
                    onTap: () => _handleSelectEndDate(context),
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    style: iregular.copyWith(
                        fontSize: 14, color: DoctorColor.textgrey),
                    decoration: InputDecoration(
                      hintText:
                          selectedEndDate?.toIso8601String() ?? 'End Date',
                      fillColor: themedata.isdark
                          ? DoctorColor.lightblack
                          : DoctorColor.bgcolor,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          DoctorPngimage.calendar,
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
                    controller: _noteController,
                    validator: ValidationBuilder().minLength(3).build(),
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    style: iregular.copyWith(
                        fontSize: 14, color: DoctorColor.black),
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Description'.tr,
                      fillColor: themedata.isdark
                          ? DoctorColor.lightblack
                          : DoctorColor.bgcolor,
                      filled: true,
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
                InkWell(
                  splashColor: DoctorColor.transparent,
                  highlightColor: DoctorColor.transparent,
                  onTapDown: createPetActivity,
                  child: Container(
                    height: height / 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: DoctorColor.primary),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 22),
                      child: Center(
                        child: Text("Register".tr,
                            style: imedium.copyWith(
                                fontSize: 16, color: DoctorColor.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
