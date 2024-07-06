import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/utils/helping/request.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:get/get.dart';

enum MenuItem { Edit, Delete }

class ActivityListItem extends StatefulWidget {
  final petActivityItem;
  final petId;
  const ActivityListItem(
      {super.key, required this.petActivityItem, required this.petId});

  @override
  State<ActivityListItem> createState() => _ActivityListItemState();
}

class _ActivityListItemState extends State<ActivityListItem> {
  final themedata = Get.put(DoctorThemecontroler());
  double height = 0.00;
  double width = 0.00;
  dynamic size;
  MenuItem? selectedItem;

  Future<void> deletePet() async {
    await Request.deletePetActivity(
        widget.petActivityItem['token'], widget.petId);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String startDate = "";
    String endDate = "";
    Color statusTextColor = widget.petActivityItem['status'] == "Active"
        ? Color.fromARGB(255, 0, 72, 196)
        : Color.fromARGB(255, 196, 0, 0);
    Color statusBackgroundColor = widget.petActivityItem['status'] == "Active"
        ? Color.fromARGB(72, 50, 160, 250)
        : Color.fromARGB(71, 250, 50, 50);
    if (widget.petActivityItem['startTime'] != null) {
      String temp = widget.petActivityItem['startTime'];
      startDate = formatter.format(DateTime.parse(temp));
    }

    if (widget.petActivityItem['endTime'] != null) {
      String temp = widget.petActivityItem['endTime'];
      endDate = formatter.format(DateTime.parse(temp));
    }

    return Container(
      decoration: BoxDecoration(
        color: themedata.isdark ? DoctorColor.lightblack : DoctorColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 56),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 96,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.local_activity_sharp),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.petActivityItem['name'],
                      style: isemibold.copyWith(fontSize: 20),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: statusBackgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Text(
                      widget.petActivityItem['status'],
                      style: isemibold.copyWith(
                        fontSize: 15,
                        color: statusTextColor,
                      ),
                    )),
              ],
            ),
            Text(widget.petActivityItem['note']),
            SizedBox(
              height: height / 96,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Start Date:",
                      style: isemibold.copyWith(),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(startDate)
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Text(
                      "End Date:",
                      style: isemibold.copyWith(),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(endDate)
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height / 70,
            ),
          ],
        ),
      ),
    );
  }
}
