import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vetner360/component/activity-list-item/index.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/helping/request.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:get/get.dart';

class ActivityList extends StatefulWidget {
  final String petId;
  const ActivityList({super.key, required this.petId});

  @override
  State<ActivityList> createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  PageController pageController = PageController();
  final themedata = Get.put(DoctorThemecontroler());
  double height = 0.00;
  double width = 0.00;
  dynamic size;
  final int _limit = 5;
  final PagingController<int, dynamic> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      try {
        Request()
            .getMyPetActivity(pageKey, _limit, widget.petId, context)
            .then((latestPetActivity) {
          setState(() {
            final isLastPage = latestPetActivity.length < this._limit;
            if (isLastPage) {
              _pagingController.appendLastPage(latestPetActivity);
            } else {
              final nextPageKey = pageKey + 1;
              _pagingController.appendPage(latestPetActivity, nextPageKey);
            }
          });
        });
      } catch (e) {
        print("Error: $e");
        _pagingController.error = e;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
        appBar: AppBar(
          surfaceTintColor:
              themedata.isdark ? DoctorColor.black : DoctorColor.white,
          title: Text(
            "Pet Activity",
            style: isemibold.copyWith(
                fontSize: 26,
                color:
                    themedata.isdark ? DoctorColor.white : DoctorColor.black),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: RefreshIndicator(
            onRefresh: () => Future.sync(() => _pagingController.refresh()),
            child: PagedListView<int, dynamic>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<dynamic>(
                animateTransitions: true,
                transitionDuration: const Duration(milliseconds: 500),
                itemBuilder: (context, item, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ActivityListItem(
                    petActivityItem: item,
                    petId: widget.petId,
                  ),
                ),
              ),
            )));
  }
}
