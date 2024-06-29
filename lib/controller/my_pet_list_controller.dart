import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vetner360/component/bottom-modal/index.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:vetner360/helping/request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPetListController extends GetxController {
  PageController pageController = PageController();
  final themedata = Get.put(DoctorThemecontroler());
  final pagingController = PagingController(firstPageKey: 0).obs;
  final int _limit = 5;

  MyPetListController(BuildContext context) {
    pagingController.value.addPageRequestListener((pageKey) {
      try {
        Request().getMyPet(pageKey, _limit, context).then((latestPets) {
          final isLastPage = latestPets.length < this._limit;
          if (isLastPage) {
            pagingController.value.appendLastPage(latestPets);
          } else {
            final nextPageKey = pageKey + 1;
            pagingController.value.appendPage(latestPets, nextPageKey);
          }
        });
      } catch (e) {
        print("Error: $e");
        pagingController.value.error = e;
      }
    });
  }

  void registerPet(BuildContext context) async {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return BottomModal();
        });
  }
}
