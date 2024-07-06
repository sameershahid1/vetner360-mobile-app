import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vetner360/utils/helping/chat_request.dart';
import 'package:vetner360/utils/helping/help.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersChatListController extends GetxController {
  PageController pageController = PageController();
  final themedata = Get.put(DoctorThemecontroler());
  final searchController = TextEditingController();
  final pagingController = PagingController(firstPageKey: 0).obs;
  final int _limit = 5;

  void searchUser() {
    pagingController.value.refresh();
  }

  UsersChatListController(BuildContext context) {
    pagingController.value.addPageRequestListener((pageKey) {
      try {
        Helping.getToken("id").then((id) {
          ChatRequest.loadChatParticipant(
                  "${id}", pageKey, searchController.text, _limit, context)
              .then((latestParticipant) {
            final isLastPage = latestParticipant.length < this._limit;
            if (isLastPage) {
              pagingController.value.appendLastPage(latestParticipant);
            } else {
              final nextPageKey = pageKey + 1;
              pagingController.value.appendPage(latestParticipant, nextPageKey);
            }
          });
        });
      } catch (e) {
        print("Error: $e");
        pagingController.value.error = e;
      }
    });
  }
}
