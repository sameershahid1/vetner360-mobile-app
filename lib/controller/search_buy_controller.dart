import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vetner360/utils/helping/home_request.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBuyController extends GetxController {
  PageController pageController = PageController();
  final themedata = Get.put(DoctorThemecontroler());
  RxString search = "".obs;
  final pagingController = PagingController(firstPageKey: 0).obs;
  final int _limit = 5;

  SearchBuyController(BuildContext context) {
    pagingController.value.addPageRequestListener((pageKey) {
      try {
        HomePannelRequest.getLatestSellPet(pageKey, _limit, null, context)
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

  void searchOnChange(String searchPet, BuildContext context) {
    try {
      search.value = searchPet;
      HomePannelRequest.getLatestSellPet(0, _limit, searchPet, context)
          .then((latestPets) {
        final isLastPage = latestPets.length < this._limit;
        if (isLastPage) {
          pagingController.value.appendLastPage(latestPets);
        } else {
          final nextPageKey = 0 + 1;
          pagingController.value.appendPage(latestPets, nextPageKey);
        }
      });
    } catch (e) {
      print("Error: $e");
      pagingController.value.error = e;
    }
  }
}
