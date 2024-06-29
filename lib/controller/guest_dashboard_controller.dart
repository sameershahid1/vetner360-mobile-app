import 'package:vetner360/helping/chat_request.dart';
import 'package:vetner360/screen/chat/users_chat_list.dart';
import 'package:vetner360/screen/guest/home/dashboard.dart';
import 'package:vetner360/component/exit-dialog/exit_dialog.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/screen/guest/home/pannel.dart';
import '../../../theme/themecontroller.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuestDashboardController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final themedata = Get.put(DoctorThemecontroler());
  PageController pageController = PageController();
  RxInt selectedItemIndex = 0.obs;
  final List<Widget> pages = const [
    GuestPannel(),
    UsersChatList(),
  ];
  dynamic size;
  double height = 0.0;
  double width = 0.0;

  GuestDashboardController(context) {
    ChatRequest.createConnection();
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
  }

  Future<bool> onbackpressed(context) async {
    return await showDialog(
        context: context, builder: (context) => ExitDialog());
  }

  Widget bottomTabBar() {
    return BottomNavigationBar(
      currentIndex: selectedItemIndex.value,
      onTap: onTap,
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
          icon: Icon(
            Icons.message,
            color: DoctorColor.textgrey,
            weight: width / 36,
          ),
          activeIcon: CircleAvatar(
            radius: 25,
            backgroundColor: DoctorColor.lightgray,
            child: Icon(
              Icons.message,
              color: DoctorColor.primary,
              weight: width / 36,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_vert),
          label: 'More',
        ),
      ],
    );
  }

  void onTap(int index) {
    if (pages.length == index) {
      scaffoldKey.currentState!.openDrawer();
    } else {
      selectedItemIndex.value = index;
    }
  }
}
