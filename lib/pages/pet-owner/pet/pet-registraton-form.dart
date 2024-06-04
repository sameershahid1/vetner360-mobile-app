import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:text_area/text_area.dart';
import 'package:vetner360/globalclass/doctor_color.dart';
import 'package:vetner360/globalclass/doctor_fontstyle.dart';
import 'package:vetner360/globalclass/doctor_icons.dart';
import 'package:vetner360/helping/help.dart';
import 'package:vetner360/pages/authentication/doctor_signin.dart';
import 'package:vetner360/theme/doctor_themecontroller.dart';
import 'package:http/http.dart' as http;

class PetRegistrationForm extends StatefulWidget {
  const PetRegistrationForm({super.key});

  @override
  State<PetRegistrationForm> createState() => _PetRegistrationFormState();
}

class _PetRegistrationFormState extends State<PetRegistrationForm> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _noteController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _dietPlanController = TextEditingController();
  final themedata = Get.put(DoctorThemecontroler());
  bool? _vaccinated = false;

  @override
  void dispose() {
    _nameController.dispose();
    _noteController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _dietPlanController.dispose();
    super.dispose();
  }

  void showErrorSnackBar(
      GlobalKey<ScaffoldMessengerState> key, String message) {
    key.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> registerPet(TapDownDetails details) async {
    if (_formKey.currentState!.validate()) {
      try {
        final userId = await Helping().getToken("id");
        final token = await Helping().getToken("token");
        Map<String, String> headers = {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json', // Adjust content type if needed
        };
        final formData = {
          "name": _nameController.text,
          "note": _noteController.text,
          "age": _ageController.text,
          "weight": _weightController.text,
          "dietPlan": _dietPlanController.text,
          "vaccinated": _vaccinated,
          "userId": userId,
        };
        final url = Uri.parse("http://192.168.0.14:8080/mobile/api/pet/");
        // final url =
        //     Uri.parse("http://10.8.151.203:8080/mobile/api/user-registration");

        final response =
            await http.post(url, headers: headers, body: jsonEncode(formData));
        final data = jsonDecode(response.body);

        print(data);

        if (response.statusCode != 200) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(data['message']),
            backgroundColor: DoctorColor.red,
          ));
        } else {
          Navigator.pop(context);
        }
      } catch (e) {
        print('Error: $e');
      }
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
            "Register pet".tr,
            style: isemibold.copyWith(
                fontSize: 20,
                color:
                    themedata.isdark ? DoctorColor.white : DoctorColor.black),
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
                  height: height / 26,
                ),
                TextFormField(
                    controller: _dietPlanController,
                    validator: ValidationBuilder().minLength(3).build(),
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    style: iregular.copyWith(
                        fontSize: 14, color: DoctorColor.textgrey),
                    decoration: InputDecoration(
                      hintText: 'Diet Plan'.tr,
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
                  height: height / 26,
                ),
                TextFormField(
                    controller: _ageController,
                    validator: ValidationBuilder().minLength(1).build(),
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    style: iregular.copyWith(
                        fontSize: 14, color: DoctorColor.textgrey),
                    decoration: InputDecoration(
                      hintText: 'Age'.tr,
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
                    controller: _weightController,
                    validator: ValidationBuilder().minLength(1).build(),
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    style: iregular.copyWith(
                        fontSize: 14, color: DoctorColor.textgrey),
                    decoration: InputDecoration(
                      hintText: 'Weight'.tr,
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
                  height: height / 26,
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
                CheckboxListTile(
                  title: Text(
                    'Vaccination',
                    style: iregular.copyWith(
                        fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  value: _vaccinated, // Your boolean state variable
                  onChanged: (newValue) {
                    setState(() {
                      _vaccinated = newValue!;
                    });
                  },
                ),
                SizedBox(
                  height: height / 36,
                ),
                InkWell(
                  splashColor: DoctorColor.transparent,
                  highlightColor: DoctorColor.transparent,
                  onTapDown: registerPet,
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
        )));
  }
}
