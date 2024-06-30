import 'package:vetner360/screen/chat/user_chat.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/helping/chat_request.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:vetner360/helping/help.dart';
import 'package:flutter/material.dart';

class ChatUserItem extends StatefulWidget {
  const ChatUserItem({super.key, required this.detailInfo});
  final detailInfo;

  @override
  State<ChatUserItem> createState() => _ChatUserItemState();
}

class _ChatUserItemState extends State<ChatUserItem> {
  final img = DoctorPngimage.d1;
  dynamic size;
  double height = 0;
  String content = "";
  String time = "";

  @override
  void initState() {
    Helping.getToken("id").then((String? id) {
      if (id != null) {
        String roomId = "${id}${widget.detailInfo['token']}";
        ChatRequest.getLatestMessage(roomId, context).then((message) {
          setState(() {
            content = message['content'];
            time =
                "${DateTime.parse(message['created_at']).hour}:${DateTime.parse(message['created_at']).minute}";
          });
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;

    return InkWell(
      onTapDown: (TapDownDetails tapDownDetails) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return UserChat(detailInfo: widget.detailInfo);
            },
          ),
        );
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
                    width: height / 9,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.detailInfo['firstName']} ${widget.detailInfo['lastName']}",
                      style: isemibold.copyWith(fontSize: 17),
                    ),
                    Text(
                      "${content}",
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${time}",
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
