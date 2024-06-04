import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vetner360/globalclass/doctor_color.dart';
import 'package:vetner360/globalclass/doctor_fontstyle.dart';
import 'package:vetner360/globalclass/doctor_icons.dart';
import 'package:vetner360/pages/pet-owner/bookings/doctor_bookings.dart';
import 'package:vetner360/pages/pet-owner/home/doctor_home.dart';
import 'package:vetner360/pages/pet-owner/home/pannel.dart';
import 'package:vetner360/pages/pet-owner/location/doctor_location.dart';
import 'package:vetner360/pages/profile/doctor_profile.dart';

import '../../../theme/doctor_themecontroller.dart';

// ignore: must_be_immutable
class DoctorDashboard extends StatefulWidget {
  String? index;

  DoctorDashboard(this.index, {super.key});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());

  PageController pageController = PageController();
  int _selectedItemIndex = 0;

  final List<Widget> _pages = const [
    PetOwnerPannel(),
    DoctorLocation(),
    DoctorBookings(),
    DoctorProfile(),
  ];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Future<bool> onbackpressed() async {
    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor:
                  themedata.isdark ? DoctorColor.lightblack : DoctorColor.white,
              surfaceTintColor:
                  themedata.isdark ? DoctorColor.lightblack : DoctorColor.white,
              title: Center(
                child: Text("Doctor Appointment".tr,
                    textAlign: TextAlign.end,
                    style: ibold.copyWith(fontSize: 18)),
              ),
              content: Text(
                "Are_you_sure_to_exit_from_this_app".tr,
                style: iregular.copyWith(fontSize: 13),
              ),
              actionsAlignment: MainAxisAlignment.end,
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: DoctorColor.primary),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text(
                      "Yes",
                      style: iregular.copyWith(
                          fontSize: 13, color: DoctorColor.white),
                    )),
                ElevatedButton(
                  onPressed: () async {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: DoctorColor.primary),
                  child: Text("No",
                      style: iregular.copyWith(
                          fontSize: 13, color: DoctorColor.white)),
                ),
              ],
            ));
  }

  Widget _bottomTabBar() {
    return BottomNavigationBar(
      currentIndex: _selectedItemIndex,
      onTap: _onTap,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: themedata.isdark ? DoctorColor.black : DoctorColor.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: DoctorColor.grey,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            DoctorPngimage.home,
            height: height / 36,
            color: DoctorColor.textgrey,
          ),
          activeIcon: CircleAvatar(
            backgroundColor: DoctorColor.lightgray,
            radius: 25,
            child: Image.asset(
              DoctorPngimage.homefill,
              height: height / 36,
              color: DoctorColor.primary,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            DoctorPngimage.location,
            height: height / 36,
            color: DoctorColor.textgrey,
          ),
          activeIcon: CircleAvatar(
            radius: 25,
            backgroundColor: DoctorColor.lightgray,
            child: Image.asset(
              DoctorPngimage.locationfill,
              height: height / 36,
              color: DoctorColor.primary,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            DoctorPngimage.calendar,
            height: height / 36,
            color: DoctorColor.textgrey,
          ),
          activeIcon: CircleAvatar(
            radius: 25,
            backgroundColor: DoctorColor.lightgray,
            child: Image.asset(
              DoctorPngimage.calendarfill,
              height: height / 36,
              color: DoctorColor.primary,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            DoctorPngimage.profile,
            height: height / 36,
            color: DoctorColor.textgrey,
          ),
          activeIcon: CircleAvatar(
            radius: 25,
            backgroundColor: DoctorColor.lightgray,
            child: Image.asset(
              DoctorPngimage.profilefill,
              height: height / 36,
              color: DoctorColor.primary,
            ),
          ),
          label: '',
        ),
      ],
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: onbackpressed,
      child: GetBuilder<DoctorThemecontroler>(builder: (controller) {
        return Scaffold(
          bottomNavigationBar: _bottomTabBar(),
          body: _pages[_selectedItemIndex],
        );
      }),
    );
  }
}
