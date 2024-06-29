import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vetner360/component/chat-user-item/chat_user_item.dart';
import 'package:vetner360/controller/users_chat_list_controller.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersChatList extends StatelessWidget {
  const UsersChatList({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return GetBuilder<UsersChatListController>(
      init: UsersChatListController(context),
      dispose: (_) {
        _.controller?.searchController.dispose();
      },
      builder: (_) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor:
              _.themedata.isdark ? DoctorColor.black : DoctorColor.white,
          leadingWidth: width / 1,
          toolbarHeight: height / 6,
          leading: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Chats",
                    style: isemibold.copyWith(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: _.themedata.isdark
                          ? DoctorColor.white
                          : DoctorColor.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 13, right: 13),
                child: TextFormField(
                  controller: _.searchController,
                  onTap: _.searchUser,
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(
                      fontSize: 14, color: DoctorColor.textgrey),
                  decoration: InputDecoration(
                    hintText: 'Search user...'.tr,
                    fillColor: _.themedata.isdark
                        ? DoctorColor.lightblack
                        : DoctorColor.bgcolor,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                        DoctorPngimage.search,
                        height: height / 36,
                      ),
                    ),
                    hintStyle: iregular.copyWith(
                        fontSize: 14, color: DoctorColor.textgrey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: DoctorColor.border)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: DoctorColor.border)),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () =>
              Future.sync(() => _.pagingController.value.refresh()),
          child: PagedListView<int, dynamic>(
            pagingController: _.pagingController.value,
            builderDelegate: PagedChildBuilderDelegate<dynamic>(
              itemBuilder: (context, item, index) => ChatUserItem(
                key: ValueKey(item['token']),
                detailInfo: item,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
