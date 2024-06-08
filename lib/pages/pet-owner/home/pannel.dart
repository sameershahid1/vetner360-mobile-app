import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vetner360/component/pet-list-item/index.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/helping/request.dart';
import 'package:vetner360/pages/pet-owner/pet/camera.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:get/get.dart';

class PetOwnerPannel extends StatefulWidget {
  const PetOwnerPannel({Key? key}) : super(key: key);

  @override
  State<PetOwnerPannel> createState() => _PetOwnerPannelState();
}

class _PetOwnerPannelState extends State<PetOwnerPannel> {
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
        Request().getMyPet(pageKey, _limit).then((latestPets) {
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

  void registerPet() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return TakePictureScreen(camera: firstCamera);
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
          automaticallyImplyLeading: false,
          surfaceTintColor:
              themedata.isdark ? DoctorColor.black : DoctorColor.white,
          leadingWidth: width / 1,
          title: Text(
            "My Pets",
            style: isemibold.copyWith(
                fontSize: 26,
                color:
                    themedata.isdark ? DoctorColor.white : DoctorColor.black),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: registerPet,
          backgroundColor: DoctorColor.primary,
          child: Icon(
            Icons.add,
            color: DoctorColor.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: RefreshIndicator(
            onRefresh: () => Future.sync(() => _pagingController.refresh()),
            child: PagedListView<int, dynamic>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<dynamic>(
                itemBuilder: (context, item, index) => Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: PetListItem(item),
                ),
              ),
            )));
  }
}
