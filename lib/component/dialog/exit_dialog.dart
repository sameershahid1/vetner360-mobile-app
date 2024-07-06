import 'package:flutter/services.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';

import '../../../theme/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExitDialog extends StatelessWidget {
  ExitDialog({super.key});
  final themedata = Get.put(DoctorThemecontroler());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:
          themedata.isdark ? DoctorColor.lightblack : DoctorColor.white,
      surfaceTintColor:
          themedata.isdark ? DoctorColor.lightblack : DoctorColor.white,
      title: Center(
        child: Text("Vetner360".tr,
            textAlign: TextAlign.end, style: ibold.copyWith(fontSize: 18)),
      ),
      content: Text(
        "Are_you_sure_to_exit_from_this_app".tr,
        style: iregular.copyWith(fontSize: 13),
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: DoctorColor.primary),
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text(
              "Yes",
              style: iregular.copyWith(fontSize: 13, color: DoctorColor.white),
            )),
        ElevatedButton(
          onPressed: () async {
            Get.back();
          },
          style: ElevatedButton.styleFrom(backgroundColor: DoctorColor.primary),
          child: Text("No",
              style: iregular.copyWith(fontSize: 13, color: DoctorColor.white)),
        ),
      ],
    );
  }
}
