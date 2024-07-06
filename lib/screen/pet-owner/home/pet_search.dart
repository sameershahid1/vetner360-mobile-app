import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vetner360/component/pet-list-item/my_pet_list_item.dart';
import 'package:vetner360/controller/buy_pet_controller.dart';
import 'package:vetner360/controller/search_buy_controller.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetSearch extends StatelessWidget {
  PetSearch({super.key});
  final themedata = Get.put(DoctorThemecontroler());
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  int serviceselected = 0;

  List name = [
    "Dr. David Patel",
    "Dr. Jessica Turner",
    "Dr. Michael Johnson",
    "Dr. Emily Walker"
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return GetBuilder<SearchBuyController>(
      init: SearchBuyController(context),
      builder: (_) => Scaffold(
        appBar: AppBar(
          surfaceTintColor: DoctorColor.white,
          leadingWidth: width / 1,
          toolbarHeight: height / 7,
          leading: Column(
            children: [
              Text(
                "Search Pet".tr,
                style: isemibold.copyWith(
                    fontSize: 20,
                    color: themedata.isdark
                        ? DoctorColor.white
                        : DoctorColor.black),
              ),
              TextFormField(
                onChanged: (search) => _.searchOnChange(search, context),
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                style: iregular.copyWith(
                    fontSize: 14, color: DoctorColor.textgrey),
                decoration: InputDecoration(
                  hintText: 'Search pet...'.tr,
                  fillColor: themedata.isdark
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
                      borderSide: const BorderSide(color: DoctorColor.border)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: DoctorColor.border)),
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
              animateTransitions: true,
              transitionDuration: const Duration(milliseconds: 500),
              itemBuilder: (context, item, index) => Padding(
                key: ValueKey(item['id']),
                padding: const EdgeInsets.all(10.0),
                child: PetListItem(
                  petItem: item['petDetail'],
                  isBuy: true,
                  phoneNumber: item['contactNo'],
                  price: item['price'],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
