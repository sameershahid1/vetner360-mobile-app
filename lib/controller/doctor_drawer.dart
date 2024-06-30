import 'package:vetner360/screen/profile/profile.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:flutter/material.dart';

class DoctorDrawer extends StatelessWidget {
  const DoctorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;

    double height = size.height;

    return Drawer(
      width: MediaQuery.of(context).size.width / 2,
      child: ListView(
        children: [
          ListTile(
            key: ValueKey(1),
            title: Row(
              children: [
                Image.asset(
                  DoctorPngimage.profile,
                  height: height / 36,
                  color: DoctorColor.textgrey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Profile")
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return UserProfile();
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
