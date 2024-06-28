import 'package:flutter/material.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/helping/help.dart';
import 'package:vetner360/helping/request.dart';
import 'package:vetner360/screen/pet-owner/pet/my_pet_detail.dart';
import 'package:vetner360/screen/pet-owner/pet/pet-edit-form.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:get/get.dart';

enum MenuItem { Edit, Delete }

class PetListItem extends StatefulWidget {
  final petItem;
  final Function? selectPet;
  PetListItem({super.key, this.petItem, this.selectPet});

  @override
  State<PetListItem> createState() => _PetListItemState();
}

class _PetListItemState extends State<PetListItem> {
  final themedata = Get.put(DoctorThemecontroler());
  double height = 0.00;
  double width = 0.00;
  dynamic size;
  MenuItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    openPetDetail() {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return MyPetDetail(
            petItem: widget.petItem,
          );
        },
      ));
    }

    Future<void> deletePet() async {
      String? userId = await Helping.getToken("id");
      await Request().deletePet(widget.petItem['token'], userId, context);
    }

    return InkWell(
      splashColor: DoctorColor.transparent,
      highlightColor: DoctorColor.transparent,
      onTap: widget.selectPet == null
          ? openPetDetail
          : () => widget.selectPet!(widget.petItem['token']),
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
              const Divider(),
              SizedBox(
                height: height / 96,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'http://vetner360.koyeb.app/${widget.petItem['imagePath']}',
                      height: height / 7,
                      width: height / 7,
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
                    width: width / 36,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width / 2.35,
                              child: Text(
                                '${widget.petItem['name']}',
                                style: ibold.copyWith(fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: height / 96,
                            ),
                            Text(
                              "${widget.petItem['type']}, ${widget.petItem['breed']}",
                              style: isemibold.copyWith(fontSize: 14),
                            ),
                            SizedBox(
                              height: height / 96,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width / 46,
                                ),
                                Text(
                                  "${widget.petItem['dietPlan']}".tr,
                                  style: iregular.copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          child: widget.selectPet == null
                              ? PopupMenuButton<MenuItem>(
                                  initialValue: selectedItem,
                                  onSelected: (MenuItem item) {
                                    if (item == MenuItem.Delete) {
                                      deletePet();
                                    } else if (item == MenuItem.Edit) {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return PetEditForm(
                                            petItem: widget.petItem,
                                          );
                                        },
                                      ));
                                    }
                                    setState(() {
                                      selectedItem = item;
                                    });
                                  },
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<MenuItem>>[
                                    const PopupMenuItem<MenuItem>(
                                      value: MenuItem.Edit,
                                      child: Text('Edit'),
                                    ),
                                    const PopupMenuItem<MenuItem>(
                                      value: MenuItem.Delete,
                                      child: Text('Delete'),
                                    ),
                                  ],
                                )
                              : null,
                        ),
                      ]),
                ],
              ),
              SizedBox(
                height: height / 96,
              ),
              const Divider(),
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
