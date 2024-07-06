import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/screen/pet-owner/activity/select_activity_pet.dart';
import 'package:vetner360/screen/pet-owner/pet/camera.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:get/get.dart';

class BottomModal extends StatefulWidget {
  const BottomModal({super.key});

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  final themedata = Get.put(DoctorThemecontroler());
  double height = 0.00;
  double width = 0.00;
  dynamic size;

  Future<void> registerPet() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return TakePictureScreen(camera: firstCamera);
      },
    ));
  }

  void selectPetForActivity() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return SelectActivityPet();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0), // Set your desired radius
      ),
      height: height / 5.5,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 55,
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: double.infinity),
              child: TextButton(
                style: OutlinedButton.styleFrom(
                  alignment: Alignment.topLeft,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: registerPet,
                child: Row(
                  children: [
                    Icon(Icons.pets),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Pet",
                      style: isemibold.copyWith(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 55,
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: double.infinity),
              child: TextButton(
                style: OutlinedButton.styleFrom(
                  alignment: Alignment.topLeft,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: selectPetForActivity,
                child: Row(
                  children: [
                    Icon(Icons.local_activity),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Activity",
                      style: isemibold.copyWith(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
