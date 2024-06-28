import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vetner360/component/pet-list-item/index.dart';
import 'package:vetner360/controller/my_pet_list.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPetList extends StatelessWidget {
  const MyPetList({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double width = size.width;

    return GetBuilder<MyPetListController>(
      init: MyPetListController(context),
      builder: (_) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor:
              _.themedata.isdark ? DoctorColor.black : DoctorColor.white,
          leadingWidth: width / 1,
          title: Text(
            "My Pets",
            style: isemibold.copyWith(
                fontSize: 26,
                color:
                    _.themedata.isdark ? DoctorColor.white : DoctorColor.black),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _.registerPet(context);
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
              itemBuilder: (context, item, index) => Padding(
                key: ValueKey(item['id']),
                padding: const EdgeInsets.all(10.0),
                child: PetListItem(
                  petItem: item,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
