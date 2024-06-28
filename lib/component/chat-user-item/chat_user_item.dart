import 'package:flutter/material.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:vetner360/screen/chat/user_chat.dart';

class ChatUserItem extends StatelessWidget {
  ChatUserItem({super.key});
  final String name = "Dr. David Patel";
  final String latestMessage = "Hi sameer what are you doing";
  final img = DoctorPngimage.d1;

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double height = size.height;
    return InkWell(
      onTapDown: (TapDownDetails tapDownDetails) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return UserChat();
        //     },
        //   ),
        // );
      },
      child: Column(
        children: [
          SizedBox(
            height: height / 55,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    img,
                    height: height / 10,
                    width: height / 10,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: isemibold.copyWith(fontSize: 17),
                    ),
                    Text(
                      latestMessage,
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "10:45pm",
                ),
              ],
            ),
          ),
          SizedBox(
            height: height / 55,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
