import 'package:vetner360/component/edit-user-profile/edit_user_profile.dart';
import 'package:vetner360/controller/edit_profile_controller.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final themedata = Get.put(DoctorThemecontroler());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
      builder: (_) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          surfaceTintColor: DoctorColor.white,
          title: Text(
            "Edit_Profile".tr,
            style: isemibold.copyWith(fontSize: 20),
          ),
        ),
        body: Obx(() => _.editProfileWidgetList[_.editProfileType.value]),
      ),
    );
  }
}
