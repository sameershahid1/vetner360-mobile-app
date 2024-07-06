import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vetner360/component/pet-list-item/sell_pet_list_item.dart';
import 'package:vetner360/controller/sell_pet_controller.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SellPet extends StatelessWidget {
  const SellPet({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double width = size.width;

    return GetBuilder<SellPetController>(
      init: SellPetController(context),
      builder: (_) => Scaffold(
        appBar: AppBar(
          surfaceTintColor:
              _.themedata.isdark ? DoctorColor.black : DoctorColor.white,
          leadingWidth: width / 1,
          leading: Row(
            children: [
              SizedBox(
                width: width / 20,
              ),
              GestureDetector(
                  onTapDown: (TapDownDetails data) {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                  )),
              Spacer(),
              Text(
                "Pet Sell",
                style: isemibold.copyWith(
                    fontSize: 26,
                    color: _.themedata.isdark
                        ? DoctorColor.white
                        : DoctorColor.black),
              ),
              Spacer(),
              Obx(
                () => Text(
                  "Total: ${_.totalPetOnSell.value}",
                  style: isemibold.copyWith(
                      fontSize: 20,
                      color: _.themedata.isdark
                          ? DoctorColor.white
                          : DoctorColor.black),
                ),
              ),
              SizedBox(
                width: width / 10,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _.sellPet(context);
          },
          backgroundColor: DoctorColor.primary,
          child: Icon(
            Icons.add,
            color: DoctorColor.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: RefreshIndicator(
          onRefresh: () =>
              Future.sync(() => _.pagingController.value.refresh()),
          child: PagedListView<int, dynamic>(
            pagingController: _.pagingController.value,
            builderDelegate: PagedChildBuilderDelegate<dynamic>(
              animateTransitions: true,
              transitionDuration: const Duration(milliseconds: 1000),
              itemBuilder: (context, item, index) => Padding(
                key: ValueKey(item['id']),
                padding: const EdgeInsets.all(10.0),
                child: SellPetListItem(
                  petItem: item,
                  isSellActive: false,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
