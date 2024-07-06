import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vetner360/utils/helping/home_request.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyPetController extends GetxController {
  PageController pageController = PageController();
  final themedata = Get.put(DoctorThemecontroler());
  RxString search = "".obs;
  final pagingController = PagingController(firstPageKey: 0).obs;
  final int _limit = 5;

  BuyPetController(BuildContext context) {
    pagingController.value.addPageRequestListener((pageKey) {
      try {
        HomePannelRequest.getLatestSellPet(pageKey, _limit,
                search.value.length == 0 ? null : search.value, context)
            .then((latestPets) {
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

  void searchOnChange(String search, BuildContext context) {
    Future.delayed(Duration(seconds: 5), () async {
      final latestPets =
          await HomePannelRequest.getLatestSellPet(0, 6, search, context);
      final isLastPage = latestPets.length < this._limit;
      if (isLastPage) {
        pagingController.value.appendLastPage(latestPets);
      } else {
        final nextPageKey = 1 + 1;
        pagingController.value.appendPage(latestPets, nextPageKey);
      }
    });
  }
}
