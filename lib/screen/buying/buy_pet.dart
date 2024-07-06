import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vetner360/controller/buy_pet_controller.dart';
import 'package:vetner360/controller/my_pet_list_controller.dart';
import 'package:vetner360/component/pet-list-item/my_pet_list_item.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyPet extends StatelessWidget {
  const BuyPet({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double width = size.width;

    return GetBuilder<BuyPetController>(
      init: BuyPetController(context),
      builder: (_) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor:
              _.themedata.isdark ? DoctorColor.black : DoctorColor.white,
          leadingWidth: width / 1,
          title: Text(
            "Buy Pets",
            style: isemibold.copyWith(
                fontSize: 26,
                color:
                    _.themedata.isdark ? DoctorColor.white : DoctorColor.black),
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
