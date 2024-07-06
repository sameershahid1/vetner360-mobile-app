import 'package:vetner360/controller/sell_pet_dialog_controller.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellPetListItem extends StatefulWidget {
  final petItem;
  final bool isSellActive;
  SellPetListItem({super.key, this.petItem, required this.isSellActive});

  @override
  State<SellPetListItem> createState() => _SellPetListItemState();
}

class _SellPetListItemState extends State<SellPetListItem> {
  final themedata = Get.put(DoctorThemecontroler());
  double height = 0.00;
  double width = 0.00;
  dynamic size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    void selectPetToSell(String petId) {
      final sellPetController = Get.find<SellPetDialogController>();
      sellPetController.selectedPageIndex.value = 1;
      sellPetController.petId.value = widget.petItem['token'];
    }

    return InkWell(
      splashColor: DoctorColor.transparent,
      highlightColor: DoctorColor.transparent,
      onTapDown: (TapDownDetails detail) {
        if (widget.isSellActive) selectPetToSell(widget.petItem["token"]);
      },
      child: Container(
        decoration: BoxDecoration(
          color: themedata.isdark ? DoctorColor.lightblack : DoctorColor.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 56),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 96,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      'http://vetner360.koyeb.app/${widget.petItem['imagePath']}',
                      height: height / 11,
                      width: height / 11,
                      fit: BoxFit.fill,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress != null) {
                          return Center(
                              child: Padding(
                            padding: EdgeInsets.all(8),
                            child: CircularProgressIndicator(),
                          ));
                        } else {
                          return Center(child: child);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: width / 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.petItem['name']}',
                              style: ibold.copyWith(fontSize: 16),
                            ),
                            Text(
                              "${widget.petItem['type']}, ${widget.petItem['breed']}",
                              style: ibold.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ]),
                ],
              ),
              SizedBox(
                height: height / 96,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
