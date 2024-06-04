import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:vetner360/globalclass/doctor_color.dart';
import 'package:vetner360/globalclass/doctor_fontstyle.dart';
import 'package:vetner360/globalclass/doctor_icons.dart';
import 'package:vetner360/pages/authentication/doctor_signin.dart';
import 'package:vetner360/theme/doctor_themecontroller.dart';
import 'package:http/http.dart' as http;

class PetOwnerRegistration extends StatefulWidget {
  const PetOwnerRegistration({super.key});

  @override
  State<PetOwnerRegistration> createState() => _PetOwnerRegistrationState();
}

class _PetOwnerRegistrationState extends State<PetOwnerRegistration> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNoController = TextEditingController();
  final _passwordController = TextEditingController();
  final _conformPasswordController = TextEditingController();
  final themedata = Get.put(DoctorThemecontroler());

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNoController.dispose();
    _passwordController.dispose();
    _conformPasswordController.dispose();
    super.dispose();
  }

  String? validatePasswordMatch(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null; // No error message, so it's valid
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

  Future<void> registerAccount(TapDownDetails details) async {
    if (_formKey.currentState!.validate()) {
      try {
        final formData = {
          "firstName": _firstNameController.text,
          "lastName": _lastNameController.text,
          "email": _emailController.text,
          "phoneNo": _phoneNoController.text,
          "password": _passwordController.text,
        };
        final url =
            Uri.parse("http://192.168.0.14:8080/mobile/api/user-registration");
        // final url =
        //     Uri.parse("http://10.8.151.203:8080/mobile/api/user-registration");

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
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const DoctorSignin();
            },
          ));
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

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
              controller: _firstNameController,
              validator: ValidationBuilder().minLength(3).maxLength(25).build(),
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              style:
                  iregular.copyWith(fontSize: 14, color: DoctorColor.textgrey),
              decoration: InputDecoration(
                hintText: 'First Name'.tr,
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
                    borderSide: const BorderSide(color: DoctorColor.border)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: DoctorColor.border)),
              )),
          SizedBox(
            height: height / 26,
          ),
          TextFormField(
              controller: _lastNameController,
              validator: ValidationBuilder().minLength(3).maxLength(25).build(),
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              style:
                  iregular.copyWith(fontSize: 14, color: DoctorColor.textgrey),
              decoration: InputDecoration(
                hintText: 'Last Name'.tr,
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
                    borderSide: const BorderSide(color: DoctorColor.border)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: DoctorColor.border)),
              )),
          SizedBox(
            height: height / 36,
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
              style:
                  iregular.copyWith(fontSize: 14, color: DoctorColor.textgrey),
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
                    borderSide: const BorderSide(color: DoctorColor.border)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: DoctorColor.border)),
              )),
          SizedBox(
            height: height / 36,
          ),
          TextFormField(
              controller: _phoneNoController,
              validator: ValidationBuilder()
                  .phone()
                  .minLength(3)
                  .maxLength(25)
                  .build(),
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              style:
                  iregular.copyWith(fontSize: 14, color: DoctorColor.textgrey),
              decoration: InputDecoration(
                hintText: 'Phone No'.tr,
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
                    borderSide: const BorderSide(color: DoctorColor.border)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: DoctorColor.border)),
              )),
          SizedBox(
            height: height / 26,
          ),
          TextFormField(
              controller: _passwordController,
              validator: ValidationBuilder().minLength(6).maxLength(25).build(),
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              style:
                  iregular.copyWith(fontSize: 14, color: DoctorColor.textgrey),
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
                    borderSide: const BorderSide(color: DoctorColor.border)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: DoctorColor.border)),
              )),
          SizedBox(
            height: height / 26,
          ),
          TextFormField(
              controller: _conformPasswordController,
              validator: validatePasswordMatch,
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              style:
                  iregular.copyWith(fontSize: 14, color: DoctorColor.textgrey),
              decoration: InputDecoration(
                hintText: 'Conform Password'.tr,
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
                    borderSide: const BorderSide(color: DoctorColor.border)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: DoctorColor.border)),
              )),
          SizedBox(
            height: height / 26,
          ),
          InkWell(
            splashColor: DoctorColor.transparent,
            highlightColor: DoctorColor.transparent,
            onTapDown: registerAccount,
            child: Container(
              height: height / 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: DoctorColor.primary),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 22),
                child: Center(
                  child: Text("Create_Account".tr,
                      style: imedium.copyWith(
                          fontSize: 16, color: DoctorColor.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
