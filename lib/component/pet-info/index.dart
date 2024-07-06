import 'package:vetner360/screen/pet-owner/activity/activity_list.dart';
import 'package:vetner360/screen/pet-owner/pet/pet_edit_form.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PetInfo extends StatefulWidget {
  final petItem;
  final int? price;
  const PetInfo({super.key, required this.petItem, this.price});

  @override
  State<PetInfo> createState() => _PetInfoState();
}

class _PetInfoState extends State<PetInfo> {
  String formatedDateOfBirth = "";

  handleEditScreen(TapDownDetails details) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return PetEditForm(
          petItem: widget.petItem,
        );
      },
    ));
  }

  Future<String> formattingDateOfBirth() async {
    await initializeDateFormatting();
    final dt = DateTime.parse(widget.petItem['birthDate']);
    final formatter = DateFormat('MM-dd-yyyy');

    return formatter.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    formattingDateOfBirth().then((value) {
      setState(() {
        formatedDateOfBirth = value;
      });
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Description: ",
                textAlign: TextAlign.start,
                style: isemibold.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "${widget.petItem['note']}",
                style: iregular.copyWith(
                  fontSize: 16,
                ),
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: widget.price != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.price_change,
                                color: Colors.blueAccent,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set border radius
                                color: Color.fromARGB(28, 33, 149, 243),
                              ),
                              padding: EdgeInsets.all(8),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Price",
                                  style: isemibold.copyWith(fontSize: 20),
                                ),
                                Text(
                                  '${widget.price} PKR',
                                  style: isemibold.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : null,
          ),
          SizedBox(
            height: widget.price != null ? 25 : 0,
          ),
          Container(
            child: widget.price != null
                ? null
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Basic Info",
                        style: isemibold.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTapDown: handleEditScreen,
                        child: Text(
                          "Edit",
                          style: isemibold.copyWith(
                              fontSize: 18, color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
          ),
          SizedBox(
            height: widget.price != null ? 0 : 10,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.pets,
                          color: Colors.blueAccent,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10.0), // Set border radius
                          color: Color.fromARGB(28, 33, 149, 243),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: isemibold.copyWith(fontSize: 20),
                          ),
                          Text(
                            '${widget.petItem['name']}',
                            style: isemibold.copyWith(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.add_reaction,
                          color: Colors.blueAccent,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10.0), // Set border radius
                          color: Color.fromARGB(28, 33, 149, 243),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nick Name",
                            style: isemibold.copyWith(fontSize: 20),
                          ),
                          Text(
                            '${widget.petItem['nickName']}',
                            style: isemibold.copyWith(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.account_tree_sharp,
                          color: Colors.blueAccent,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10.0), // Set border radius
                          color: Color.fromARGB(28, 33, 149, 243),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Species",
                            style: isemibold.copyWith(fontSize: 20),
                          ),
                          Text(
                            '${widget.petItem['type']}',
                            style: isemibold.copyWith(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.transform_outlined,
                          color: Colors.blueAccent,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10.0), // Set border radius
                          color: Color.fromARGB(28, 33, 149, 243),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Breed",
                            style: isemibold.copyWith(fontSize: 20),
                          ),
                          Text(
                            '${widget.petItem['breed']}',
                            style: isemibold.copyWith(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.airline_stops_outlined,
                          color: Colors.blueAccent,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10.0), // Set border radius
                          color: Color.fromARGB(28, 33, 149, 243),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sex",
                            style: isemibold.copyWith(fontSize: 20),
                          ),
                          Text(
                            '${widget.petItem['gender']}',
                            style: isemibold.copyWith(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.date_range_sharp,
                          color: Colors.blueAccent,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10.0), // Set border radius
                          color: Color.fromARGB(28, 33, 149, 243),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "BirthDate",
                            style: isemibold.copyWith(fontSize: 20),
                          ),
                          Text(
                            '$formatedDateOfBirth',
                            style: isemibold.copyWith(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.monitor_weight,
                          color: Colors.blueAccent,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10.0), // Set border radius
                          color: Color.fromARGB(28, 33, 149, 243),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Weight",
                            style: isemibold.copyWith(fontSize: 20),
                          ),
                          Text(
                            '${widget.petItem['weight']} lbs',
                            style: isemibold.copyWith(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          const Divider(),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Diet",
                style: isemibold.copyWith(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.food_bank,
                          color: Colors.green,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10.0), // Set border radius
                          color: Color.fromARGB(28, 33, 149, 243),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Food",
                            style: isemibold.copyWith(fontSize: 20),
                          ),
                          Text(
                            '${widget.petItem['dietPlan']}',
                            style: isemibold.copyWith(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          const Divider(),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Report",
                style: isemibold.copyWith(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            // style: OutlinedButton.styleFrom(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(0),
            //   ),
            // ),
            splashColor: const Color.fromARGB(76, 158, 158, 158),
            highlightColor: const Color.fromARGB(78, 158, 158, 158),
            onTapDown: (TapDownDetails details) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ActivityList(petId: widget.petItem['token']);
                },
              ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.local_activity,
                        color: Colors.purple,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(6.0), // Set border radius
                        color: Color.fromARGB(117, 181, 13, 223),
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Activity",
                      style: isemibold.copyWith(fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
              // style: OutlinedButton.styleFrom(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(0),
              //   ),
              // ),
              splashColor: const Color.fromARGB(76, 158, 158, 158),
              highlightColor: const Color.fromARGB(78, 158, 158, 158),
              onTapDown: (TapDownDetails details) {
                print("DF");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.report,
                          color: Colors.green,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Color.fromARGB(117, 13, 223, 41),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Doctor Report",
                        style: isemibold.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          InkWell(
            // style: OutlinedButton.styleFrom(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(0),
            //   ),
            // ),
            splashColor: const Color.fromARGB(76, 158, 158, 158),
            highlightColor: const Color.fromARGB(78, 158, 158, 158),
            onTapDown: (TapDownDetails details) {
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) {
              //     return TakePictureScreen(camera: firstCamera);
              //   },
              // ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.note,
                        color: Colors.blueAccent,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(6.0), // Set border radius
                        color: Color.fromARGB(117, 14, 133, 231),
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Prescription",
                      style: isemibold.copyWith(fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
