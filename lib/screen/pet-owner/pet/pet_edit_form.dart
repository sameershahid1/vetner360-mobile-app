import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:vetner360/helping/help.dart';
import 'package:vetner360/screen/pet-owner/home/dashboard.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:http/http.dart' as http;

List<String> dropdownItems = ['Male', 'Female'];

class PetEditForm extends StatefulWidget {
  final petItem;
  const PetEditForm({super.key, required this.petItem});

  @override
  State<PetEditForm> createState() => _PetEditFormState();
}

class _PetEditFormState extends State<PetEditForm> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nickNameController = TextEditingController();
  final _noteController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _dietPlanController = TextEditingController();
  final themedata = Get.put(DoctorThemecontroler());
  bool? _vaccinated = false;
  String? _selectGender = dropdownItems.first;
  DateTime? selectedDate;

  @override
  void initState() {
    this._nameController.text = widget.petItem['name'];
    this._noteController.text = widget.petItem['note'];
    this._ageController.text = widget.petItem['age'];
    this._weightController.text = widget.petItem['weight'];
    this._dietPlanController.text = widget.petItem['dietPlan'];
    this._vaccinated = widget.petItem['vaccinated'];
    this._nickNameController.text = widget.petItem['nickName'];
    _selectGender = widget.petItem['gender'];
    selectedDate = DateTime.parse(widget.petItem['birthDate']);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _noteController.dispose();
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

  Future<void> editPet(TapDownDetails details) async {
    if (_formKey.currentState!.validate()) {
      try {
        final userId = await Helping.getToken("id");
        final token = await Helping.getToken("token");
        Map<String, String> headers = {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        };

        final formData = {
          "name": _nameController.text,
          "nickName": _nickNameController.text,
          "gender": _selectGender,
          "birthDate": selectedDate!.toIso8601String(),
          "note": _noteController.text,
          "age": _ageController.text,
          "weight": _weightController.text,
          "dietPlan": _dietPlanController.text,
          "vaccinated": _vaccinated,
          "userId": userId,
        };
        final url = Uri.parse(
            "http://vetner360.koyeb.app//mobile/api/pet/${widget.petItem['token']}");

        final response =
            await http.patch(url, headers: headers, body: jsonEncode(formData));
        final data = jsonDecode(response.body);

        if (response.statusCode != 200) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(data['message']),
            backgroundColor: DoctorColor.red,
          ));
        } else {
          Navigator.of(context).popUntil((route) => route.isFirst);
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
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
            "Edit pet profile".tr,
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
                    controller: _nickNameController,
                    validator: ValidationBuilder().minLength(3).build(),
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    style: iregular.copyWith(
                        fontSize: 14, color: DoctorColor.textgrey),
                    decoration: InputDecoration(
                      hintText: 'Nick Name'.tr,
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
                    readOnly: true,
                    // validator: ValidationBuilder().minLength(1).build(),
                    onTap: () => _selectDate(context),
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    style: iregular.copyWith(
                        fontSize: 14, color: DoctorColor.textgrey),
                    decoration: InputDecoration(
                      hintText:
                          selectedDate?.toIso8601String() ?? 'Date of Birth',
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
                DropdownButton<String>(
                  value: _selectGender,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectGender = newValue;
                    });
                  },
                  items: dropdownItems
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: Text('Select Gender'),
                  icon: Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                ),
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
                  value: _vaccinated,
                  onChanged: (bool? newValue) {
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
                  onTapDown: editPet,
                  child: Container(
                    height: height / 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: DoctorColor.primary),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 22),
                      child: Center(
                        child: Text("Save".tr,
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
