import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:vetner360/controller/sell_pet_dialog_form_controller.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/icons.dart';

class SellPetForm extends StatelessWidget {
  const SellPetForm({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return GetBuilder<SellPetDialogFormController>(
      init: SellPetDialogFormController(),
      dispose: (_) {
        _.controller?.priceController.dispose();
        _.controller?.contactNoController.dispose();
      },
      builder: (_) => SingleChildScrollView(
        child: Form(
          key: _.formKey,
          child: Column(
            children: [
              TextFormField(
                  controller: _.priceController,
                  validator: ValidationBuilder().minLength(1).build(),
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(
                      fontSize: 14, color: DoctorColor.textgrey),
                  decoration: InputDecoration(
                    hintText: 'Price'.tr,
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
                  controller: _.contactNoController,
                  validator: ValidationBuilder().minLength(1).phone().build(),
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(
                      fontSize: 14, color: DoctorColor.textgrey),
                  decoration: InputDecoration(
                    hintText: 'Contact-No'.tr,
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
                onTapDown: (TapDownDetails data) {
                  _.submitForm(context);
                },
                child: Container(
                  height: height / 15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: DoctorColor.primary),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 22),
                    child: Center(
                      child: Text("Sell".tr,
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
    );
  }
}
