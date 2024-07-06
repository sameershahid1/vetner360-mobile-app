import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vetner360/component/dialog/sell_pet_dialog.dart';
import 'package:vetner360/utils/helping/pet_sell_request.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellPetController extends GetxController {
  PageController pageController = PageController();
  final themedata = Get.put(DoctorThemecontroler());
  final pagingController = PagingController(firstPageKey: 0).obs;
  final RxInt totalPetOnSell = 0.obs;
  final int _limit = 5;

  SellPetController(BuildContext context) {
    pagingController.value.addPageRequestListener((pageKey) {
      try {
        PetSellRequest.getPetsOnSell(pageKey, _limit, context).then((response) {
          if (response != null) {
            final isLastPage = response["records"]?.length < this._limit;
            if (isLastPage) {
              pagingController.value.appendLastPage(response["records"]);
            } else {
              final nextPageKey = pageKey + 1;
              pagingController.value
                  .appendPage(response["records"], nextPageKey);
            }
          }
          totalPetOnSell.value = response["count"];
        });
      } catch (e) {
        print("Error: $e");
        pagingController.value.error = e;
      }
    });
  }

  void sellPet(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SellPetDialog();
      },
    );
  }
}
