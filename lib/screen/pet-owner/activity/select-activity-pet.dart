import 'package:vetner360/screen/pet-owner/activity/activity-register-form.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vetner360/component/pet-list-item/index.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/helping/request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectActivityPet extends StatefulWidget {
  const SelectActivityPet({super.key});

  @override
  State<SelectActivityPet> createState() => _SelectActivityPetState();
}

class _SelectActivityPetState extends State<SelectActivityPet> {
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
        Request().getMyPet(pageKey, _limit, context).then((latestPets) {
          setState(() {
            final isLastPage = latestPets.length < this._limit;
            if (isLastPage) {
              _pagingController.appendLastPage(latestPets);
            } else {
              final nextPageKey = pageKey + 1;
              _pagingController.appendPage(latestPets, nextPageKey);
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

  void selectPet(String petId) async {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return ActivityRegisterForm(petId: petId);
      },
    ));
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
            "Select Pet",
            style: isemibold.copyWith(
                fontSize: 26,
                color:
                    themedata.isdark ? DoctorColor.white : DoctorColor.black),
          ),
        ),
        body: RefreshIndicator(
            onRefresh: () => Future.sync(() => _pagingController.refresh()),
            child: PagedListView<int, dynamic>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<dynamic>(
                itemBuilder: (context, item, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: PetListItem(
                    petItem: item,
                    selectPet: selectPet,
                  ),
                ),
              ),
            )));
  }
}
