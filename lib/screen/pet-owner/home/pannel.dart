import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vetner360/component/pet-list-item/index.dart';
import 'package:vetner360/controller/pet-owner-pannel.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetOwnerPannel extends StatelessWidget {
  const PetOwnerPannel({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double width = size.width;

    return GetBuilder<PetOwnerPannelController>(
        init: PetOwnerPannelController(),
        dispose: (_) {
          _.controller?.pagingController.value.dispose();
        },
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
                    color: _.themedata.isdark
                        ? DoctorColor.white
                        : DoctorColor.black),
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
                      padding: const EdgeInsets.all(10.0),
                      child: PetListItem(
                        petItem: item,
                      ),
                    ),
                  ),
                ))));
  }
}
